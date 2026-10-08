cask "anyk-vhkovny" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/vhkovny/nav_vhkovny"
  name "NAV VHKOVNY Template"
  desc "A követelésfoglalás kiadásához első körben felhívó levél kerül kiküldésre az adózó részére, hogy a gazdálkodásával, tevékenységével kapcsolatos számviteli nyilvántartások közül az aktuális főkönyvi ki
Ezen követeléseket tartalmazó dokumentumok, adatok beküldésére szolgál a VHKOVNY elnevezésű adatlap."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/vhkovny"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_vhkovny.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VHKOVNY*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VHKOVNY template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
