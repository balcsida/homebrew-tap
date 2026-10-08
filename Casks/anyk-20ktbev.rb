cask "anyk-20ktbev" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20KTBEV/NAV_20KTBEV"
  name "NAV 20KTBEV Template"
  desc "Környezetvédelmi termékdíj és a gépjármű-termékdíjátalány 2020. évi bevallása"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20KTBEV"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20KTBEV.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20KTBEV*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20KTBEV template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
