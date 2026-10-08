cask "anyk-22enjov" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22enjov/nav_22enjov"
  name "NAV 22ENJOV Template"
  desc "Bevallás a feldolgozóipari gyártókra vonatkozó 2022. évi energiaellátók jövedelemadó-előlegéről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22enjov"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_22enjov.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*22ENJOV*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 22ENJOV template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
