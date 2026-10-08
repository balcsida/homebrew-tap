cask "anyk-22tfejlh" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22tfejlh/nav_22tfejlh"
  name "NAV 22TFEJLH Template"
  desc "Bevallás a turizmusfejlesztési hozzájárulásról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22tfejlh"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_22tfejlh.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*22TFEJLH*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 22TFEJLH template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
