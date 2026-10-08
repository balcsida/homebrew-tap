cask "anyk-2029eud" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2029EUD/NAV_2029EUD"
  name "NAV 2029EUD Template"
  desc "A 2020. évben kezdődő üzleti évi társasági adónak, az energiaellátók jövedelemadójának, 
az innovációs járuléknak, valamint a szakképzési hozzájárulás különbözetének, 
és a növekedési adóhitelnek a bevallása az előtársaságok, a naptári évtől eltérő 
üzleti évet választó adózók, valamint a forintról devizára, devizáról forintra, 
devizáról más devizára áttérő adózók részére"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2029EUD"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_2029EUD.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2029EUD*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2029EUD template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
