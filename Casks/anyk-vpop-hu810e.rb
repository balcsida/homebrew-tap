cask "anyk-vpop-hu810e" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_hu810e/VPOP_hu810e"
  name "NAV VPOP_HU810E Template"
  desc "NAV_VP_HU810E Adatszolgáltatás törlése vagy jövedéki termék 72 órán belüli visszaszállítása "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_hu810e"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_hu810e.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_HU810E*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_HU810E template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
