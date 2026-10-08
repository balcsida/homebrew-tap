cask "anyk-20k86" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20K86/NAV_20K86"
  name "NAV 20K86 Template"
  desc "jelű, a kifizetőnek minősülő befektetési szolgáltató adatszolgáltatása a magánszemély részére (ideértve az Szja tv. szerint a társasházat is) 2020. évben megvalósult ellenőrzött tőkepiaci ügyletről ki"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20K86"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20K86.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20K86*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20K86 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
