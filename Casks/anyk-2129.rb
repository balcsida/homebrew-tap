cask "anyk-2129" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2129/nav_2129"
  name "NAV 2129 Template"
  desc "Bevallás és 2129-A adatszolgáltatás a 2021. évi társasági adóról, az energiaellátók jövedelemadójáról, illetve az innovációs járulékról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2129"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2129.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2129*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2129 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
