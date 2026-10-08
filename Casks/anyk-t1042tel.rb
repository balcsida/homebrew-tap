cask "anyk-t1042tel" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1042TEL/nav_t1042tel"
  name "NAV T1042TEL Template"
  desc "Bejelentő- és változásbejelentő az egyszerűsített foglalkoztatásról szóló 2010. évi LXXV. törvény értelmében a 2010. augusztus 1-jét követően létesített egyszerűsített foglalkoztatás adatairól, telefo"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1042TEL"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_t1042tel.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*T1042TEL*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV T1042TEL template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
