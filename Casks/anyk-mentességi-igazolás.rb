cask "anyk-mentességi-igazolás" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/mentessegi_igazolas/NAV_mentessegi_igazolas"
  name "NAV Mentességi igazolás Template"
  desc ""
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/mentessegi_igazolas"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_mentessegi_igazolas.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*MENTESSéGI IGAZOLáS*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV Mentességi igazolás template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
