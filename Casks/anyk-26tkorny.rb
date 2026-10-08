cask "anyk-26tkorny" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/26TKORNY/26tkorny"
  name "NAV 26TKORNY Template"
  desc "Bejelentő és változásbejelentő a 2026. évi környezetvédelmi termékdíj kötelezettségről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/26TKORNY"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "26tkorny.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*26TKORNY*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 26TKORNY template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
