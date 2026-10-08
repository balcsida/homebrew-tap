cask "anyk-20szja" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20SZJA/NAV_2053"
  name "NAV 20SZJA Template"
  desc "A 2020. adóévről szóló személyi jövedelemadó, a járulék, az egyszerűsített közteherviselési hozzájárulás, a szociális hozzájárulási adó bevallásához, helyesbítéséhez, önellenőrzéséhez"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20SZJA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_2053.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20SZJA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20SZJA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
