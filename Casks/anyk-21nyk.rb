cask "anyk-21nyk" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21nyk/nav_21nyk"
  name "NAV 21NYK Template"
  desc "a külföldi illetőségű magánszemély nyilatkozata a személyijövedelemadó-bevallás benyújtás alóli mentesítéséhez a 2021. adóévre"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21nyk"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_21nyk.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*21NYK*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 21NYK template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
