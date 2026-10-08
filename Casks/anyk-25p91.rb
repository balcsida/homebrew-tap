cask "anyk-25p91" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25P91/nav_25p91"
  name "NAV 25P91 Template"
  desc "Bevallás a hitelintézetek és pénzügyi vállalkozások különadójáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25P91"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_25p91.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*25P91*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 25P91 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
