cask "anyk-2129eud" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2129EUD/NAV_2129EUD"
  name "NAV 2129EUD Template"
  desc "A 2021. évben kezdődő üzleti évi társasági adónak, az energiaellátók jövedelemadójának, az innovációs járuléknak, valamint a szakképzési hozzájárulás különbözetének, és a növekedési adóhitelnek a beva"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2129EUD"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_2129EUD.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2129EUD*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2129EUD template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
