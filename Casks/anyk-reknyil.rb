cask "anyk-reknyil" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/REKNYIL/NAV_reknyil"
  name "NAV REKNYIL Template"
  desc "Nyilatkozat a reklámadóról szóló 2014. évi XXII. törvény 5. § (4) bekezdése alapján, 
az Európai Unió működéséről szóló szerződés 107. és 108. cikkének a csekély összegű 
támogatásokra való alkalmazásáról szóló, 2013. december 18-i 1407/2013/EU bizottsági 
rendelet (HL L 352., 2013.12.24., 1. o.) szerinti csekély összegű (de minimis) 
támogatásról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/REKNYIL"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_reknyil.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*REKNYIL*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV REKNYIL template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
