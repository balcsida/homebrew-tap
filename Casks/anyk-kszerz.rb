cask "anyk-kszerz" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/KSZERZ/nav_kszerz"
  name "NAV KSZERZ Template"
  desc "adatszolgáltatás az szja tv. 65/c. § (9) bekezdése szerint figyelembe vehető szerzési értékkel összefüggésben"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/KSZERZ"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_kszerz.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*KSZERZ*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV KSZERZ template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
