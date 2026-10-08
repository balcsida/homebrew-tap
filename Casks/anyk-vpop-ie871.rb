cask "anyk-vpop-ie871" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_ie871/VPOP_ie871"
  name "NAV VPOP_IE871 Template"
  desc "NAV_VP_IE871 Magyarázó üzenet az észlelt hiány okáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_ie871"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_ie871.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_IE871*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_IE871 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
