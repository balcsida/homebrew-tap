cask "anyk-20hipa" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20HIPA/NAV_20HIPA"
  name "NAV 20HIPA Template"
  desc "Bevallás a helyi iparűzési adóról állandó jellegű iparűzési tevékenység esetén"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20HIPA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20HIPA.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20HIPA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20HIPA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
