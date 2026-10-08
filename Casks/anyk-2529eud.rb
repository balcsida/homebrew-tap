cask "anyk-2529eud" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2529EUD/nav_2529eud"
  name "NAV 2529EUD Template"
  desc "A 2025. évben kezdődő üzleti évi társasági adónak, az energiaellátók jövedelemadójának, az innovációs járuléknak, valamint a növekedési adóhitelnek a bevallása az előtársaságok, a naptári évtől eltérő"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2529EUD"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2529eud.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2529EUD*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2529EUD template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
