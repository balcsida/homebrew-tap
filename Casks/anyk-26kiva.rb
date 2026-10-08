cask "anyk-26kiva" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/26KIVA/nav_26kiva"
  name "NAV 26KIVA Template"
  desc "Bevallás a kisvállalati adóról és egyéb kötelezettségekről (társasági adó, innovációs járulék, energiaellátók jövedelemadója)"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/26KIVA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_26kiva.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*26KIVA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 26KIVA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
