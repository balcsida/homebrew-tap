cask "anyk-ujegyke" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/UJEGYKE/nav_ujegyke"
  name "NAV UJEGYKE Template"
  desc "Egységes képviseleti adatlap a NAV-nál intézhető ügyekben az állandó képviselet bejelentéséhez"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/UJEGYKE"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_ujegyke.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*UJEGYKE*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV UJEGYKE template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
