cask "anyk-2008int" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2008INT/NAV_2008INT"
  name "NAV 2008INT Template"
  desc "Havi bevallás az 1997. évi LXXX. törvény 56/A. § szerinti kötelezettek részére 
a szociális hozzájárulási adóról, a járulékokról és egyéb adatokról - Monthly 
Declaration on social contribution tax, contributions and other data for subjects 
as per section 56/A of Act LXXX of 1997."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2008INT"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_2008INT.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2008INT*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2008INT template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
