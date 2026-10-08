cask "anyk-25elekafa" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25ELEKAFA/nav_25elekafa"
  name "NAV 25ELEKAFA Template"
  desc "25ELEKAFA JELŰ NYOMTATVÁNY AZ ART. 185. § (1) BEKEZDÉSÉBEN MEGHATÁROZOTT ADÓALANYT AZ EURÓPAI KÖZÖSSÉG VALAMELY TAGÁLLAMÁBÓL MEGILLETŐ HOZZÁADOTTÉRTÉK-ADÓ VISSZATÉRÍTTETÉSÉHEZ"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25ELEKAFA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_25elekafa.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*25ELEKAFA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 25ELEKAFA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
