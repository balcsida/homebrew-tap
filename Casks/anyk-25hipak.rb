cask "anyk-25hipak" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25HIPAK/nav_25hipak"
  name "NAV 25HIPAK Template"
  desc "NAV 25HIPAK form template for ÁNYK"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25HIPAK"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_25hipak.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*25HIPAK*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 25HIPAK template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
