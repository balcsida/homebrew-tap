cask "anyk-bion" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_bion/NAV_bion.jar"
  name "NAV BION Template"
  desc "BION bevallás az 500 000 forintot meghaladó bírósági eljárási illeték önadózással  
történő teljesítéséhez az Itv. 74. § (1b)-(1d) alapján "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_bion"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_bion.jar.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*BION*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV BION template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
