cask "anyk-vpop-ie810" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_ie810/VPOP_ie810"
  name "NAV VPOP_IE810 Template"
  desc "NAV_VP_IE810 Elektronikus adminisztratív okmány törlése"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_ie810"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_ie810.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_IE810*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_IE810 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
