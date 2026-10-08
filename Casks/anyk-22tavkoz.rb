cask "anyk-22tavkoz" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22tavkoz/nav_22tavkoz"
  name "NAV 22TAVKOZ Template"
  desc "Bevallás a 2022. évi távközlési pótadóról és pótadóelőlegről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22tavkoz"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_22tavkoz.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*22TAVKOZ*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 22TAVKOZ template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
