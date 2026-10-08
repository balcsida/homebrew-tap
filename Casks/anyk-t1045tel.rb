cask "anyk-t1045tel" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1045TEL/nav_t1045tel"
  name "NAV T1045TEL Template"
  desc "Bejelentő és változásbejelentő lap az Art. 1. számú mellékletének 14. pontja alapján a közérdekű nyugdíjas szövetkezet biztosítottnak nem minősülő, a szövetkezetekről szóló 2006. évi X. törvény szerin"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1045TEL"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_t1045tel.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*T1045TEL*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV T1045TEL template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
