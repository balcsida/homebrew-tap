cask "anyk-20cbc" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20CBC/NAV_20CBC"
  name "NAV 20CBC Template"
  desc "Adatszolgáltatás a multinacionális vállalatcsoport országonkénti jelentéséről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20CBC"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20CBC.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20CBC*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20CBC template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
