cask "anyk-2171" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2171/NAV_2171.jar"
  name "NAV 2171 Template"
  desc " Bevallás a tevékenységét 2021. évben megszüntető, átalakulással megszűnő, a 
kisadózó 
vállalkozások tételes adóját vagy a kisvállalati adót 2021. évben vagy 2022. évtől 
választó adózók részére "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2171"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_2171.jar.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2171*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2171 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
