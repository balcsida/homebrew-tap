cask "anyk-25elekafa-kiigny" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25ELEKAFA_KIIGNY/nav_25elekafa_kiigny"
  name "NAV 25ELEKAFA_KIIGNY Template"
  desc "25ELEKAFA_ KIIGNY JELŰ NYOMTATVÁNY az Art. 185. § (1) bekezdésében meghatározott adóalanyt az Európai Közösség valamely tagállamából megillető hozzáadottérték-adó visszatéríttetési kérelmének kiigazít"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25ELEKAFA_KIIGNY"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_25elekafa_kiigny.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*25ELEKAFA_KIIGNY*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 25ELEKAFA_KIIGNY template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
