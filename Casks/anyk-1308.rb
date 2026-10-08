cask "anyk-1308" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/1308/NAV_1308"
  name "NAV 1308 Template"
  desc "Havi bevallás a kifizetésekkel, juttatásokkal összefüggő adóról, járulékokról 
és egyéb adatokról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/1308"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_1308.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*1308*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 1308 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
