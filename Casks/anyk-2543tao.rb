cask "anyk-2543tao" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2543TAO/nav_2543tao"
  name "NAV 2543TAO Template"
  desc "Bevallás a kisvállalati adó hatálya alól kikerült, 2025-ben a társaságiadó alanyává vált adózók társaságiadó-előlegéről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2543TAO"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2543tao.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2543TAO*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2543TAO template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
