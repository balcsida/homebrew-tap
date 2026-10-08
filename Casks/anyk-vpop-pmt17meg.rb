cask "anyk-vpop-pmt17meg" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_PMT17MEG/VPOP_pmt17meg"
  name "NAV VPOP_PMT17MEG Template"
  desc " 
A pénzmosás és a terrorizmus
finanszírozása megelőzéséről és megakadályozásáról szóló 2017. évi LIII. törvény
42. § (2) bekezdésében meghatározott megkeresés teljesítésének megválaszolása
védelemmel ellátott elektronikus üzenet formájában a Pmt. hatálya alá tartozó
szolgáltatók számára "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_PMT17MEG"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_pmt17meg.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_PMT17MEG*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_PMT17MEG template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
