cask "anyk-2293" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2293/nav_2293"
  name "NAV 2293 Template"
  desc "Bevallás a 2022. évi pénzügyi tranzakciós illetékről és az egyes pénzügyi eszközök vétele után keletkezett tranzakciós illetékről, valamint a 2023. évi illetékfizetési kötelezettségről."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2293"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2293.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2293*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2293 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
