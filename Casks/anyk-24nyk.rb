cask "anyk-24nyk" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24NYK/nav_24nyk"
  name "NAV 24NYK Template"
  desc "Nyilatkozat külföldi illetőségű magánszemély személyijövedelemadó-bevallás alóli mentesítéséhez a 2024. évre"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24NYK"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_24nyk.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*24NYK*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 24NYK template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
