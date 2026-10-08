cask "anyk-vpop-hu815r" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_HU815R/vpop_hu815r"
  name "NAV VPOP_HU815R Template"
  desc "Repülőgép üzemanyag adómentes kiszolgálásának bizonylata"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_HU815R"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "vpop_hu815r.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VPOP_HU815R*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VPOP_HU815R template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
