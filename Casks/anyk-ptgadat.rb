cask "anyk-ptgadat" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/PTGADAT/NAV_ptgadat"
  name "NAV PTGADAT Template"
  desc "Az adóügyi ellenőrző egységen (AEE) eltárolt és a NAV-hoz továbbított online pénztárgép forgalmi adatainak kiadása.
A PTGADAT jelű nyomtatvány 2026. március 31-én megszűnik. Az online pénztárgép forgalmi adatai már lekérdezhetők a KOBAK-portálon (https://kobakonline.nav.gov.hu)"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/PTGADAT"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_ptgadat.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*PTGADAT*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV PTGADAT template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
