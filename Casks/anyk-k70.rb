cask "anyk-k70" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k70/NAV_k70"
  name "NAV K70 Template"
  desc "A letétkezelő (a program szervező) adatszolgáltatása és bejelentése az elismert
munkavállalói értékpapír-juttatási program keretében a magánszemély javára egyedi
letétként őrzött értékpapírokról, valamint a letétkezelő változásáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k70"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_k70.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K70*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K70 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
