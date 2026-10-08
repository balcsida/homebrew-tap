cask "anyk-20k102" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20K102/NAV_20K102"
  name "NAV 20K102 Template"
  desc "
jelű
adatszolgáltatás a kisadózó vállalkozás részére a 2020. évben juttatott, 1
millió forintot meghaladó kifizetésről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20K102"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20K102.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20K102*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20K102 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
