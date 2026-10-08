cask "anyk-21a215" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21A215/NAV_21A215"
  name "NAV 21A215 Template"
  desc "Negyedéves/éves bevallás a szociálpolitikai menetdíj-támogatás személyszállítási 
tevékenységek szerinti adatairól"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21A215"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_21A215.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*21A215*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 21A215 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
