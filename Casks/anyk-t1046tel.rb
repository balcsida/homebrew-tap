cask "anyk-t1046tel" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1046TEL/nav_t1046tel"
  name "NAV T1046TEL Template"
  desc "Bejelentő és változásbejelentő lap a kisgyermekkel otthon lévők szövetkezete biztosítottnak nem minősülő, megállapodás keretében közreműködő tagjáról, telefonos bejelentés esetén"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1046TEL"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_t1046tel.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*T1046TEL*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV T1046TEL template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
