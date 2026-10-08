cask "anyk-vpop-regado" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_regado/VPOP_regado.jar"
  name "NAV VPOP_REGADO Template"
  desc "Regisztrációs Adó Adatlapok feldolgozására szolgáló nyomtatvány"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_regado"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_regado.jar.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_REGADO*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_REGADO template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
