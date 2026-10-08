cask "anyk-24enjov" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24ENJOV/nav_24enjov"
  name "NAV 24ENJOV Template"
  desc "Bevallás a feldolgozóipari gyártókra vonatkozó 2024. évi energiaellátók jövedelemadó-előlegéről. "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24ENJOV"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_24enjov.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*24ENJOV*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 24ENJOV template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
