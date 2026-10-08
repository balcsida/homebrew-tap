cask "anyk-25kta" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25KTA/nav_25kta"
  name "NAV 25KTA Template"
  desc "Bevallás a termékdíjátalány-fizetésre jogosult csekély mennyiségű kibocsátó kötelezettek részére 2025. évre"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25KTA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_25kta.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*25KTA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 25KTA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
