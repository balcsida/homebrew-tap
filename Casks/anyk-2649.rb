cask "anyk-2649" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2649/nav_2649"
  name "NAV 2649 Template"
  desc "Bevallás a 2026. évben kötelezetté váló adózók innovációs járulékelőlegéről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2649"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2649.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2649*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2649 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
