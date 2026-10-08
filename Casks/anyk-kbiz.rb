cask "anyk-kbiz" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/KBIZ/nav_kbiz"
  name "NAV KBIZ Template"
  desc "Adatszolgáltatás a bizalmi vagyonkezelési jogviszony alapján kezelt vagyon és a magánalapítványi vagyon adókötelezettségével összefüggésben "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/KBIZ"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_kbiz.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*KBIZ*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV KBIZ template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
