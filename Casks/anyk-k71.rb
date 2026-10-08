cask "anyk-k71" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/K71/nav_k71"
  name "NAV K71 Template"
  desc "A társas vállalkozás adatszolgáltatása az adóévben jegyzett tőkéjének felemelését, valamint az általa kibocsátott átváltoztatható kötvény átalakítását követően kibocsátott (megemelt névértékű) összes "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/K71"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_k71.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K71*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K71 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
