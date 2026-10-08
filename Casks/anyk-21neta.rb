cask "anyk-21neta" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21NETA/NAV_21NETA"
  name "NAV 21NETA Template"
  desc "Bevallás a népegészségügyi termékadóról 2021. év "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21NETA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_21NETA.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*21NETA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 21NETA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
