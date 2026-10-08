cask "anyk-adatlap-2024" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/Adatlap_2024/nav_adatlap_2024"
  name "NAV ADATLAP_2024 Template"
  desc "Adatlap 2024 az Flt. 36/A. § (2) bekezdés 11-12. pontjához a munkáltatótól (társas  vállalkozástól) származó jövedelemről az adó és adóelőleg levonásáról a munkaviszony (tagsági viszony) megszűnésekor"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/Adatlap_2024"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_adatlap_2024.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*ADATLAP_2024*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV ADATLAP_2024 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
