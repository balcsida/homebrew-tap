cask "anyk-24p90" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24p90/nav_24p90"
  name "NAV 24P90 Template"
  desc "Bevallás a pénzügyi szervezetek, valamint a forgalmazók és a befektetési alapok különadójáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24p90"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_24p90.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*24P90*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 24P90 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
