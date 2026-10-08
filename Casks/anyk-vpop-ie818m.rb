cask "anyk-vpop-ie818m" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_ie818m/VPOP_ie818m"
  name "NAV VPOP_IE818M Template"
  desc "NAV_VP_IE818M Átvételi elismervény jövedéki termék adófelfüggesztéssel/szabadforgalomban történő szállításához"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_ie818m"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_ie818m.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_IE818M*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_IE818M template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
