cask "anyk-2529" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2529/nav_2529"
  name "NAV 2529 Template"
  desc "Bevallás és 2529-A adatszolgáltatás a 2025. évi társasági adóról, az energiaellátók jövedelemadójáról, illetve az innovációs járulékról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2529"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2529.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2529*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2529 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
