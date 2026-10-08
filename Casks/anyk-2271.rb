cask "anyk-2271" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2271/nav_2271"
  name "NAV 2271 Template"
  desc "A tevékenységét 2022. évben megszüntető, átalakulással megszűnő, a kisadózó vállalkozások tételes adóját 2022. évben vagy a kisvállalati adót 2022. évben vagy 2023. évtől választó adózók részére."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2271"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2271.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2271*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2271 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
