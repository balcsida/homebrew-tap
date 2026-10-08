cask "anyk-birert" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/birert/NAV_BIRERT"
  name "NAV BIRERT Template"
  desc "Bírósági értesítés a le nem rótt eljárási illetékről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/birert"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_BIRERT.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*BIRERT*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV BIRERT template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
