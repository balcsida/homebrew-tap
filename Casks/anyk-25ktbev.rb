cask "anyk-25ktbev" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25KTBEV/nav_25ktbev"
  name "NAV 25KTBEV Template"
  desc "Környezetvédelmi termékdíj és a gépjármű-termékdíjátalány 2025. évi bevallása"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25KTBEV"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_25ktbev.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*25KTBEV*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 25KTBEV template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
