cask "anyk-23tfejlh" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/23TFEJLH/nav_23tfejlh"
  name "NAV 23TFEJLH Template"
  desc "Bevallás a turizmusfejlesztési hozzájárulásról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/23TFEJLH"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_23tfejlh.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*23TFEJLH*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 23TFEJLH template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
