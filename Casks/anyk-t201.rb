cask "anyk-t201" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T201/nav_t201"
  name "NAV T201 Template"
  desc "Bejelentő és változásbejelentő lap a cégjegyzésre nem kötelezett jogi személyek, nonprofit szervezetek - a törzskönyvi jogi személyek és civil szervezetek kivételével -, külföldi vállalkozások, tulajd"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T201"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_t201.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*T201*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV T201 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
