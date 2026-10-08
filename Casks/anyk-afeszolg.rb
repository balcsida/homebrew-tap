cask "anyk-afeszolg" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/AFESZOLG/NAV_afeszolg"
  name "NAV AFESZOLG Template"
  desc "Adatszolgáltatás felügyeleti szolgáltatóknak az élelmiszer-értékesítést kezelőszemélyzet 
nélkül végző automatáról, adóügyi felügyeleti egységről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/AFESZOLG"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_afeszolg.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*AFESZOLG*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV AFESZOLG template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
