cask "anyk-2420" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2420/nav_2420"
  name "NAV 2420 Template"
  desc "Bevallás a biztosítási adóról, a biztosítási pótadóelőlegről, a biztosítási pótadó-elszámolásról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2420"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2420.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2420*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2420 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
