cask "anyk-21szja" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21szja/nav_21szja"
  name "NAV 21SZJA Template"
  desc "Bevallás a 2021. évre a személyi jövedelemadóról, az egyszerűsített közteherviselési hozzájárulásról, a szociális hozzájárulási adóról, mindezek helyesbítéséről, önellenőrzéséről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21szja"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_21szja.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*21SZJA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 21SZJA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
