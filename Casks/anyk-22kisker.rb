cask "anyk-22kisker" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22kisker/nav_22kisker"
  name "NAV 22KISKER Template"
  desc "Bevallás a kiskereskedelmi adóról és adóelőlegről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22kisker"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_22kisker.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*22KISKER*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 22KISKER template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
