cask "anyk-2108int" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2108INT/NAV_2108INT"
  name "NAV 2108INT Template"
  desc " Havi bevallás a 2019. évi CXXII. törvény 87. § szerinti kötelezettek részére 
a szociális hozzájárulási adóról, a járulékokról és egyéb adatokról - Monthly 
Declaration on Social Contribution Tax, Contributions and Other Data for Subjects 
as per Section 87 of Act CXXII of 2019"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2108INT"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_2108INT.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2108INT*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2108INT template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
