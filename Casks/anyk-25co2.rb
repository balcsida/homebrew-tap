cask "anyk-25co2" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25CO2/nav_25co2"
  name "NAV 25CO2 Template"
  desc "Bevallás a jelentős térítésmentes kibocsátóegység-kiosztásban részesülő létesítmény üzemeltetőjének szén-dioxid-kvóta adójáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25CO2"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_25co2.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*25CO2*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 25CO2 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
