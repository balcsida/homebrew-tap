cask "anyk-adatlap-2020" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/ADATLAP_2020/NAV_ADATLAP_2020"
  name "NAV ADATLAP_2020 Template"
  desc "Adatlap 2020 A munkáltatótól (társas vállalkozástól) származó jövedelemről, az 
adó és adóelőleg levonásáról a munkaviszony (tagsági viszony) megszűnésekor"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/ADATLAP_2020"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_ADATLAP_2020.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*ADATLAP_2020*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV ADATLAP_2020 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
