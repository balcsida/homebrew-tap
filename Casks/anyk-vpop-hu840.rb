cask "anyk-vpop-hu840" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_HU840/VPOP_hu840"
  name "NAV VPOP_HU840 Template"
  desc "NAV_VP_HU840 Üzenet szállítóeszköz váltás bejelentéséről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_HU840"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_hu840.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_HU840*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_HU840 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
