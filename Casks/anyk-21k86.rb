cask "anyk-21k86" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21k86/nav_21k86"
  name "NAV 21K86 Template"
  desc "A kifizetőnek minősülő befektetési szolgáltató adatszolgáltatása a magánszemély (ideértve az Szja tv. szerint a társasházat is) részére a 2021. évben megvalósult ellenőrzött tőkepiaci ügyletről kiállí"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21k86"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_21k86.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*21K86*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 21K86 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
