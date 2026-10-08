cask "anyk-1408" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/1408/NAV_1408"
  name "NAV 1408 Template"
  desc "havi bevallás a kifizetésekkel, juttatásokkal összefüggő adóról, járulékokról 
és egyéb adatokról, valamint a szakképzési hozzájárulásról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/1408"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_1408.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*1408*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 1408 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
