cask "anyk-22a96" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22a96/nav_22a96"
  name "NAV 22A96 Template"
  desc "Adatszolgáltatás a társasági és osztalékadóról szóló 1996. évi LXXXI. törvény 29/C. § (10) bekezdés alapján az adózók és a kapcsolt vállalkozásnak minősülő pénzügyi intézmények részére"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22a96"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_22a96.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*22A96*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 22A96 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
