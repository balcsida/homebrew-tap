cask "anyk-26enkado" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/26ENKADO/nav_26enkado"
  name "NAV 26ENKADO Template"
  desc "Bevallás az energiaellátók különadó kötelezettségéről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/26ENKADO"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_26enkado.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*26ENKADO*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 26ENKADO template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
