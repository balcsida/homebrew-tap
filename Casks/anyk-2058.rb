cask "anyk-2058" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2058/NAV_2058"
  name "NAV 2058 Template"
  desc " Bevallás a kiegészítő tevékenységet folytatónak nem minősülő 
egyéni vállalkozó szociális hozzájárulási adó és járulék kötelezettségeiről, valamint 
a biztosított mezőgazdasági őstermelő járulék kötelezettségeiről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2058"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_2058.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2058*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2058 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
