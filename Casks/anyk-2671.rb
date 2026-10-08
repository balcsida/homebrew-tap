cask "anyk-2671" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2671/nav_2671"
  name "NAV 2671 Template"
  desc "Bevallás a tevékenységét 2026. évben megszüntető, átalakulással megszűnő, a kisvállalati adót 2026. évben vagy 2027. évtől választó adózók részére."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2671"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2671.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2671*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2671 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
