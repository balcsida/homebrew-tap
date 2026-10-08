cask "anyk-24koolaj" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24KOOLAJ/nav_24koolaj"
  name "NAV 24KOOLAJ Template"
  desc "Bevallás a kőolajtermék-előállító vállalkozások különadójáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24KOOLAJ"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_24koolaj.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*24KOOLAJ*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 24KOOLAJ template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
