cask "anyk-2593" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2593/nav_2593"
  name "NAV 2593 Template"
  desc "BEVALLÁS a 2025. évi pénzügyi tranzakciós és kiegészítő pénzügyi tranzakciós illetékről, az egyes pénzügyi eszközök vétele után keletkezett tranzakciós és kiegészítő pénzügyi tranzakciós illetékről, é"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2593"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2593.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2593*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2593 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
