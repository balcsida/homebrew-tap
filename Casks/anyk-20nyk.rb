cask "anyk-20nyk" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20NYK/NAV_20NYK"
  name "NAV 20NYK Template"
  desc "a külföldi illetőségű magánszemély nyilatkozata a személyijövedelemadó-bevallás 
benyújtás alóli mentesítéséhez a 2020. adóévre"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20NYK"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20NYK.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20NYK*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20NYK template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
