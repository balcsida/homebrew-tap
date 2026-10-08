cask "anyk-25t118" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25T118/nav_25t118"
  name "NAV 25T118 Template"
  desc "Adatlap és változásbejelentő lap a csoportos társasági adóalanyisággal kapcsolatos közös kérelem benyújtásához, illetve változásbejelentéshez"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25T118"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_25t118.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*25T118*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 25T118 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
