cask "anyk-igvill" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/igvill/nav_igvill"
  name "NAV IGVILL Template"
  desc "Összesítő igazolás a kifizető által az adóévben a magánszemély részére juttatott villamosenergia értékesítésből származó bevételről."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/igvill"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_igvill.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*IGVILL*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV IGVILL template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
