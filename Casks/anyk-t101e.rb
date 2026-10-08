cask "anyk-t101e" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T101E/nav_t101e"
  name "NAV T101E Template"
  desc "Bejelentő- és változásbejelentő lap az egyéni vállalkozók nyilvántartásában szereplő egyéni vállalkozók részére."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T101E"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_t101e.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*T101E*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV T101E template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
