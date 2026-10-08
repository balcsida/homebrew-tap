cask "anyk-igazolas-53-ef" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/IGAZOLAS_53_EF/nav_igazolas_53_ef"
  name "NAV IGAZOLAS_53_EF Template"
  desc "Igazolás az egyszerűsített foglalkoztatásból származó bevételről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/IGAZOLAS_53_EF"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_igazolas_53_ef.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*IGAZOLAS_53_EF*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV IGAZOLAS_53_EF template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
