cask "anyk-nav-oke" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_OKE/nav_nav_oke"
  name "NAV NAV_OKE Template"
  desc "A kőolajtermék-előállító, kőolajtermék-kereskedő jelentése az orosz kőolajembargó betartásáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_OKE"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_nav_oke.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*NAV_OKE*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV NAV_OKE template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
