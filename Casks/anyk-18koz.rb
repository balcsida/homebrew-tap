cask "anyk-18koz" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/18KOZ/NAV_18KOZ"
  name "NAV 18KOZ Template"
  desc "Közlemény az adózó rendelkezése szerint a kedvezményezett részére átutalt összeg 
felhasználásáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/18KOZ"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_18KOZ.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*18KOZ*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 18KOZ template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
