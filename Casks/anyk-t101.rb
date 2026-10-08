cask "anyk-t101" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T101/nav_t101"
  name "NAV T101 Template"
  desc "Bejelentő- és változásbejelentőlap azon magánszemélyeknek, akik adószám kiváltására kötelezettek, de nem szerepelnek az egyéni vállalkozók nyilvántartásában."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T101"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_t101.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*T101*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV T101 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
