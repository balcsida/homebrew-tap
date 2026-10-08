cask "anyk-t1044tel" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1044TEL/nav_t1044tel"
  name "NAV T1044TEL Template"
  desc "Bejelentő és változásbejelentő lap az Art. 1. számú mellékletének 14. pontja alapján az iskolaszövetkezet biztosítottnak nem minősülő, a szövetkezetekről szóló 2006. évi X. törvény 10/B. § (2) bekezdé"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1044TEL"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_t1044tel.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*T1044TEL*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV T1044TEL template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
