cask "anyk-nav-v02-kszf" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_V02_KSZF/nav_v02_kszf"
  name "NAV NAV_V02_KSZF Template"
  desc "Kötelező Érvényű Származási Felvilágosítás határozat (KSZF-határozat) iránti kérelem"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_V02_KSZF"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_v02_kszf.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*NAV_V02_KSZF*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV NAV_V02_KSZF template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
