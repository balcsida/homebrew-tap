cask "anyk-ptgm" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/ptgm/NAV_ptgm"
  name "NAV PTGM Template"
  desc "Kérelem a közvetlen adatlekérdezéssel megvalósított adatszolgáltatás teljesítése 
alóli egyedi mentesítésre irányuló eljáráshoz."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/ptgm"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_ptgm.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*PTGM*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV PTGM template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
