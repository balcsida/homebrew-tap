cask "anyk-26rendny" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/26RENDNY/nav_26rendny"
  name "NAV 26RENDNY Template"
  desc "Rendelkezés a 2026. évre vonatkozóan a társasági adóelőleg kedvezményezett célra történő felajánlásáról az 1996. évi LXXXI. törvény 24/A. § (1) és (4) bekezdése alapján"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/26RENDNY"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_26rendny.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*26RENDNY*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 26RENDNY template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
