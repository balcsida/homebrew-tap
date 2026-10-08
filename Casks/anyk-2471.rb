cask "anyk-2471" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2471/nav_2471"
  name "NAV 2471 Template"
  desc "Bevallás a tevékenységét 2024. évben megszüntető, átalakulással megszűnő, a kisvállalati adót 2024. évben vagy 2025. évtől választó adózók részére"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2471"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2471.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2471*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2471 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
