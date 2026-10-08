cask "anyk-t1043tel" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1043TEL/nav_t1043tel"
  name "NAV T1043TEL Template"
  desc "Bejelentő és változásbejelentő lap a természetes személyek között háztartási munkára létesített, munkavégzésre irányuló jogviszony adatairól, telefonon teljesített bejelentéskor"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1043TEL"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_t1043tel.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*T1043TEL*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV T1043TEL template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
