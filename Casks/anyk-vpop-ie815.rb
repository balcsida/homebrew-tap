cask "anyk-vpop-ie815" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_ie815/VPOP_ie815"
  name "NAV VPOP_IE815 Template"
  desc "Adminisztratív kísérő okmány (e-TKO/e-EKO tervezet) a jövedéki termékek jövedékiadó-felfüggesztéssel/szabadforgalomban történő szállításához"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_ie815"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_ie815.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_IE815*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_IE815 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
