cask "anyk-25szja" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25SZJA/nav_25szja"
  name "NAV 25SZJA Template"
  desc "Bevallás a 2025. évre a személyi jövedelemadóról, az egyszerűsített közteherviselési hozzájárulásról, a szociális hozzájárulási adóról, mindezek helyesbítéséről, önellenőrzéséről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25SZJA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_25szja.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*25SZJA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 25SZJA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
