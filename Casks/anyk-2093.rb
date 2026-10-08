cask "anyk-2093" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2093/NAV_2093"
  name "NAV 2093 Template"
  desc " Bevallás a 2020. évi pénzügyi tranzakciós illeték, valamint a 2021. évi illetékfizetési 
kötelezettségről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2093"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_2093.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2093*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2093 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
