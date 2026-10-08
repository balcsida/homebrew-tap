cask "anyk-nav-uhg01" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_UHG01/NAV_nav_uhg01"
  name "NAV NAV_UHG01 Template"
  desc "Üzemanyag-forgalmazók jelentése 
(a forgalomba hozott üzemanyagból és más közlekedési célú energiatermékből származó 
üvegházhatású gázkibocsátásról) "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_UHG01"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_nav_uhg01.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*NAV_UHG01*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV NAV_UHG01 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
