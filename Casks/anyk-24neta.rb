cask "anyk-24neta" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24NETA/nav_24neta"
  name "NAV 24NETA Template"
  desc "Bevallás a népegészségügyi termékadóról 2024. év"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24NETA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_24neta.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*24NETA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 24NETA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
