cask "anyk-22t34" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22t34/nav_22t34"
  name "NAV 22T34 Template"
  desc "Bejelentő és változásbejelentő a természetes személy adóazonosítójelének, vámazonosító számának egyedi kiadásához, az adateltérések rendezéséhez és levelezési cím bejelentéséhez"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22t34"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_22t34.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*22T34*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 22T34 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
