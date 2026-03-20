#!/bin/bash
set -euo pipefail

# Generate ÁNYK template casks from NAV API
# Usage: ./scripts/generate-casks.sh [--dry-run] [--form FORM_ID]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
CASKS_DIR="$REPO_DIR/Casks"
API_URL="https://nav.gov.hu/api/declarationForms?archive=false&baseTheme=site"
DRY_RUN=false
SINGLE_FORM=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --dry-run) DRY_RUN=true; shift ;;
    --form) SINGLE_FORM="$2"; shift 2 ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

log() { echo "[$(date '+%H:%M:%S')] $*" >&2; }

# Fetch form page and extract download URL
get_download_url() {
  local content_url="$1"
  local page_url="https://nav.gov.hu${content_url}"

  # Fetch page and find the template JAR download link (not doc)
  local download_path
  download_path=$(curl -s "$page_url" -H "User-Agent: Mozilla/5.0" | \
    grep -oE 'pfile/programFile\?path=[^"]+' | \
    grep -v '_doc_' | \
    grep -v 'doc_' | \
    head -1)

  if [[ -n "$download_path" ]]; then
    echo "https://nav.gov.hu/$download_path"
  fi
}

# Extract JAR filename from download URL
get_jar_filename() {
  local url="$1"
  # Extract the filename from path parameter
  echo "$url" | sed 's/.*path=.*\///' | sed 's/$/\.jar/'
}

# Generate cask file content
generate_cask() {
  local form_id="$1"
  local display_name="$2"
  local description="$3"
  local homepage="$4"
  local download_url="$5"
  local jar_filename="$6"

  # Create cask name (lowercase, replace special chars)
  local cask_name
  cask_name=$(echo "anyk-${form_id}" | tr '[:upper:]' '[:lower:]' | tr '_' '-' | tr ' ' '-')

  # Clean description (remove HTML tags, limit length)
  local clean_desc
  clean_desc=$(echo "$description" | sed 's/<[^>]*>//g' | cut -c1-200)

  # Pattern for uninstall (extract base form ID for .tem.enyk matching)
  local form_pattern
  form_pattern=$(echo "$form_id" | tr '[:lower:]' '[:upper:]')

  cat <<EOF
cask "${cask_name}" do
  version :latest
  sha256 :no_check

  url "${download_url}"
  name "NAV ${display_name} Template"
  desc "${clean_desc}"
  homepage "${homepage}"

  depends_on cask: "anyk"

  preflight do
    config_file = "#{HOMEBREW_PREFIX}/etc/abevjavapath.cfg"
    unless File.exist?(config_file)
      odie "ÁNYK is not installed. Please install it first with: brew install --cask anyk"
    end

    system_command "/usr/bin/unzip",
                   args: ["-o", "-q", "#{staged_path}/${jar_filename}", "application/*", "-d", staged_path.to_s],
                   print_stderr: false

    anyk_dir = File.read(config_file).strip

    Dir.glob("#{staged_path}/application/**/*").each do |src|
      next if File.directory?(src)

      relative_path = src.sub("#{staged_path}/application/", "")
      dest = File.join(anyk_dir, relative_path)
      FileUtils.mkdir_p(File.dirname(dest))
      FileUtils.cp(src, dest)
    end
  end

  uninstall_preflight do
    config_file = "#{HOMEBREW_PREFIX}/etc/abevjavapath.cfg"
    if File.exist?(config_file)
      anyk_dir = File.read(config_file).strip
      Dir.glob("#{anyk_dir}/nyomtatvanyok/*${form_pattern}*.tem.enyk").each do |f|
        FileUtils.rm_f(f)
      end
    end
  end

  caveats <<~EOS
    NAV ${display_name} template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
EOF
}

# Main processing
log "Fetching forms from NAV API..."
forms_json=$(curl -s "$API_URL" -H "Accept: application/json" -H "User-Agent: Mozilla/5.0")

# Filter to forms with contentUrl pointing to nyomtatvanykitolto_programok
forms=$(echo "$forms_json" | jq -c '.[] | select(.contentUrl != null) | select(.contentUrl | contains("nyomtatvanykitolto_programok"))')

total=$(echo "$forms" | wc -l | tr -d ' ')
log "Found $total forms with downloadable templates"

created=0
skipped=0
failed=0

echo "$forms" | while IFS= read -r form; do
  form_id=$(echo "$form" | jq -r '.displayName')
  content_url=$(echo "$form" | jq -r '.contentUrl')
  description=$(echo "$form" | jq -r '.formDescription.value // ""')

  # Skip if processing single form and this isn't it
  if [[ -n "$SINGLE_FORM" && "$form_id" != "$SINGLE_FORM" ]]; then
    continue
  fi

  # Generate cask filename
  cask_name=$(echo "anyk-${form_id}" | tr '[:upper:]' '[:lower:]' | tr '_' '-' | tr ' ' '-')
  cask_file="$CASKS_DIR/${cask_name}.rb"

  # Skip main anyk cask
  if [[ "$cask_name" == "anyk" ]]; then
    continue
  fi

  # Check if cask already exists
  if [[ -f "$cask_file" && -z "$SINGLE_FORM" ]]; then
    ((skipped++)) || true
    continue
  fi

  log "Processing: $form_id"

  # Get download URL from form page
  download_url=$(get_download_url "$content_url")

  if [[ -z "$download_url" ]]; then
    log "  WARNING: No download URL found for $form_id"
    ((failed++)) || true
    continue
  fi

  jar_filename=$(get_jar_filename "$download_url")
  homepage="https://nav.gov.hu${content_url}"

  if [[ "$DRY_RUN" == "true" ]]; then
    log "  Would create: $cask_file"
    log "  URL: $download_url"
  else
    generate_cask "$form_id" "$form_id" "$description" "$homepage" "$download_url" "$jar_filename" > "$cask_file"
    log "  Created: $cask_file"
  fi

  ((created++)) || true

  # Rate limiting
  sleep 0.5
done

log "Done! Created: $created, Skipped: $skipped, Failed: $failed"
