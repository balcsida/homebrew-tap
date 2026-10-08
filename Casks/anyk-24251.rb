cask "anyk-24251" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24251/nav_24251"
  name "NAV 24251 Template"
  desc "Bevallás a társaságiadó-előlegről, az innovációs járulékelőlegről, az energiaellátók jövedelemadó-előlegéről, valamint a növekedési adóhitelről a 2024. évben átalakulással létrejött jogutód adózók, to"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24251"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_24251.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*24251*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 24251 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
