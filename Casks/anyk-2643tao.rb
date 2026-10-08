cask "anyk-2643tao" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2643TAO/nav_2643tao"
  name "NAV 2643TAO Template"
  desc "Bevallás a a kisvállalati adó hatálya alól kikerült, 2026-ban a társasági adó alanyává vált adózó társaságiadó-előlegéről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2643TAO"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2643tao.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2643TAO*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2643TAO template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
