cask "anyk-2548" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2548/nav_2548"
  name "NAV 2548 Template"
  desc "Bevallás az ingatlannal rendelkező társaság külföldi tagjának a részesedése elidegenítésekor keletkező adókötelezettségéről, valamint a társaság jegyzett tőkéjének leszállítás"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2548"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2548.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2548*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2548 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
