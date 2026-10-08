cask "anyk-23nyk" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/23NYK/nav_23nyk"
  name "NAV 23NYK Template"
  desc "Nyilatkozat külföldi illetőségű magánszemély személyijövedelemadó-bevallás alóli mentesítéséhez a 2023. évre"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/23NYK"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_23nyk.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*23NYK*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 23NYK template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
