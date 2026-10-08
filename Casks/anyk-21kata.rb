cask "anyk-21kata" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21KATA/NAV_21KATA"
  name "NAV 21KATA Template"
  desc " Nyilatkozat és adatszolgáltatás megszerzett bevételről, bevallás 40 százalékos 
mértékű adóról, társasági adóról kisadózó vállalkozás részére a 2021. évre"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21KATA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_21KATA.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*21KATA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 21KATA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
