cask "anyk-09teszt" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvany_apeh/09teszt/APEH_09teszt"
  name "NAV 09teszt Template"
  desc "Az elektronikus adóbevallás teszteléséhez használható nyomtatvány. 
Ezt a nyomtatványt az abevjava_install keretprogrammal kell használnii. A nyomtatványba 
saját adatokat kell beírni (saját adószámot).."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvany_apeh/09teszt"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "APEH_09teszt.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*09TESZT*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 09teszt template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
