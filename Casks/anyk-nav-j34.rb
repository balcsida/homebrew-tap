cask "anyk-nav-j34" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_J34/NAV_j34"
  name "NAV NAV_J34 Template"
  desc "Kérelem a jövedéki biztosíték készfizető kezesként történő teljesítésének engedélyezéséhez"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_J34"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_j34.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*NAV_J34*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV NAV_J34 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
