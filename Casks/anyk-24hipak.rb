cask "anyk-24hipak" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24HIPAK/nav_24hipak"
  name "NAV 24HIPAK Template"
  desc "NAV 24HIPAK form template for ÁNYK"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24HIPAK"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_24hipak.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*24HIPAK*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 24HIPAK template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
