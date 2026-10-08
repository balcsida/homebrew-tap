cask "anyk-vpop-r11" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_r11/VPOP_r11"
  name "NAV VPOP_R11 Template"
  desc "Bejelentés és regisztrációs adatlap a KKK-WEBEN történő elektronikus kérelmek
benyújtásához"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_r11"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_r11.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_R11*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_R11 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
