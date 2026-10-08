cask "anyk-2229" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2229/nav_2229"
  name "NAV 2229 Template"
  desc "Bevallás és 2229-A adatszolgáltatás a 2022. évi társasági adóról, az energiaellátók jövedelemadójáról, illetve az innovációs járulékról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2229"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2229.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2229*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2229 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
