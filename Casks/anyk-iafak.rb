cask "anyk-iafak" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_iafak/NAV_iafak"
  name "NAV IAFAK Template"
  desc "Kérelem és kiigazítási nyilatkozat a belföldön nem letelepedett adóalanyokat 
és a Közösség más tagállamában nyilvántartásba vett nem adóalany jogi személyeket 
megillető általános forgalmiadó-visszatérítéshez"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_iafak"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_iafak.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*IAFAK*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV IAFAK template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
