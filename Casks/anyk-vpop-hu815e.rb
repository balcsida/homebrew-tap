cask "anyk-vpop-hu815e" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_hu815e/VPOP_hu815e"
  name "NAV VPOP_HU815E Template"
  desc "NAV_VP_HU815E Adatszolgáltatás jövedéki termék belföldi szabadforgalomba bocsátásáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/vpop_hu815e"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "VPOP_hu815e.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_HU815E*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_HU815E template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
