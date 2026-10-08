cask "anyk-vpop-ksz17" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_KSZ17/VPOP_ksz17"
  name "NAV VPOP_KSZ17 Template"
  desc "A Pmt. és a Kit. szerinti Kijelölt Személy tájékoztatásról szóló nyomtatvány"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_KSZ17"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_ksz17.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_KSZ17*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_KSZ17 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
