cask "anyk-20rendny" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20RENDNY/NAV_20RENDNY"
  name "NAV 20RENDNY Template"
  desc " Rendelkezés a 2020. évre vonatkozóan a társasági adóelőleg 
kedvezményezett célra történő felajánlásáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20RENDNY"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20RENDNY.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20RENDNY*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20RENDNY template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
