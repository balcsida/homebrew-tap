cask "anyk-ptgtax" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/ptgtax/NAV_ptgtax"
  name "NAV PTGTAX Template"
  desc "A pénztárgép-, és taxaméterszervizek adatszolgáltatása"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/ptgtax"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_ptgtax.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*PTGTAX*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV PTGTAX template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
