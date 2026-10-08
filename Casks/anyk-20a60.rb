cask "anyk-20a60" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20A60/NAV_20A60"
  name "NAV 20A60 Template"
  desc "Összesítő nyilatkozat az Európai Közösség területén belül történő közösségi termékértékesítésekről 
és szolgáltatásnyújtásokról, valamint az Európai Közösség területéről történő 
termékbeszerzések és szolgáltatás igénybevételekről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20A60"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20A60.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20A60*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20A60 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
