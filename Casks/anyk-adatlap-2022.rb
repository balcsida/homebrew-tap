cask "anyk-adatlap-2022" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/adatlap-2022/nav_adatlap_2022"
  name "NAV Adatlap 2022 Template"
  desc "Adatlap 2022 A munkáltatótól (társas vállalkozástól) származó jövedelemről, az adó és adóelőleg levonásáról a munkaviszony (tagsági viszony) megszűnésekor"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/adatlap-2022"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_adatlap_2022.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*ADATLAP 2022*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV Adatlap 2022 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
