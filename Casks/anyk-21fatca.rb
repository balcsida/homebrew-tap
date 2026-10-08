cask "anyk-21fatca" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21fatca/nav_21fatca"
  name "NAV 21FATCA Template"
  desc "21FATCA jelű adatszolgáltatás a FATCA szabályozás hatálya alá tartozó Jelentendő Számlákról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21fatca"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_21fatca.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*21FATCA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 21FATCA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
