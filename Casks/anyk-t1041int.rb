cask "anyk-t1041int" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1041INT/nav_t1041int"
  name "NAV T1041INT Template"
  desc "Bejelentő és változásbejelentő lap a Magyarországon fiókteleppel, pénzügyi képviselővel nem rendelkező külföldi vállalkozás, vagy - ha a bejelentést nem a munkáltató teljesíti - a külföldi vállalkozás"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1041INT"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_t1041int.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*T1041INT*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV T1041INT template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
