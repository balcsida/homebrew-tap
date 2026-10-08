cask "anyk-nav-j31" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_J31/NAV_nav_j31"
  name "NAV NAV J31 Template"
  desc "NAV NAV J31 form template for ÁNYK"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_J31"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_nav_j31.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*J31*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV NAV J31 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
