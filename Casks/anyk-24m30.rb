cask "anyk-24m30" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24M30/nav_24m30"
  name "NAV 24M30 Template"
  desc "24M30 A munkáltató, kifizető összesített igazolása a 2024. évi személyi jövedelemadó bevalláshoz"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24M30"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_24m30.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*24M30*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 24M30 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
