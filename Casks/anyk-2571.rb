cask "anyk-2571" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2571/nav_2571"
  name "NAV 2571 Template"
  desc "Bevallás a tevékenységét 2025. évben megszüntető, átalakulással megszűnő, a kisvállalati adót 2025. évben vagy 2026. évtől választó adózók részére."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2571"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2571.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2571*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2571 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
