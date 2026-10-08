cask "anyk-20k83" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20K83/NAV_20K83"
  name "NAV 20K83 Template"
  desc "
jelű,
a mezőgazdasági és vidékfejlesztési szerv adatszolgáltatása az általa a
magánszemélynek kifizetett támogatásokról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20K83"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20K83.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20K83*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20K83 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
