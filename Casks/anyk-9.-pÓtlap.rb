cask "anyk-9.-pÓtlap" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/9__POTLAP/NAV_9__potlap"
  name "NAV 9. PÓTLAP Template"
  desc "Bejelentkezési lap az egyéni vállalkozói igazolványhoz nem kötött tevékenységet 
végző vállalkozók részére"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/9__POTLAP"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_9__potlap.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*9. PÓTLAP*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 9. PÓTLAP template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
