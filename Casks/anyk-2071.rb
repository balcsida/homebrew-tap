cask "anyk-2071" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2071/NAV_2071"
  name "NAV 2071 Template"
  desc "Bevallás a tevékenységét 2020. évben megszüntető, átalakulással megszűnő, a kisadózó 
vállalkozások tételes adóját vagy a kisvállalati adót 2020. évben vagy 2021. évtől 
választó adózók részére"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2071"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_2071.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2071*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2071 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
