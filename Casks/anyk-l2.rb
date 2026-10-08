cask "anyk-l2" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/l2/NAV_l2"
  name "NAV L2 Template"
  desc "L2 adatlap gépjármű, pótkocsi vagyonszerzési illetékhez és a kitöltési útmutatója"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/l2"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_l2.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*L2*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV L2 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
