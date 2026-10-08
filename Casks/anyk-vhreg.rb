cask "anyk-vhreg" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/VHREG/NAV_VHREG"
  name "NAV VHREG Template"
  desc "A regisztrációs adatlap az Avt. szerinti végrehajtási megkeresések benyújtására 
jogosult szervezetek részére készült."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/VHREG"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_VHREG.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VHREG*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VHREG template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
