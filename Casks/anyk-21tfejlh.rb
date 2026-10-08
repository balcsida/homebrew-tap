cask "anyk-21tfejlh" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21TFEJLH/NAV_21TFEJLH"
  name "NAV 21TFEJLH Template"
  desc "Bevallás a turizmusfejlesztési hozzájárulásról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21TFEJLH"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_21TFEJLH.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*21TFEJLH*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 21TFEJLH template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
