cask "anyk-vpop-pmt17" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_PMT17/VPOP_pmt17"
  name "NAV VPOP_PMT17 Template"
  desc "Bejelentési adatlap a pénzmosásra utaló tény, adat, körülményről "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_PMT17"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_pmt17.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_PMT17*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_PMT17 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
