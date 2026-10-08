cask "anyk-26j03" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/26J03/nav_26j03"
  name "NAV 26J03 Template"
  desc "Bevallás a villamos energia, a földgáz és a szén után fizetendő, illetve visszaigényelhető jövedéki adóról, valamint az önellenőrzéssel történő helyesbítésről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/26J03"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_26j03.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*26J03*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 26J03 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
