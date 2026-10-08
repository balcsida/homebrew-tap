cask "anyk-2551" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2551/nav_2551"
  name "NAV 2551 Template"
  desc "Bevallás a biztonságos és gazdaságos gyógyszer- ésgyógyászati segédeszköz-ellátás, valamint a gyógyszerforgalmazás általánosszabályairól szóló 2006. évi XCVIII. törvény (Gyftv.) által bevallásrakötele"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2551"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2551.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2551*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2551 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
