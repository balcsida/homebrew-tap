cask "anyk-k64" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k64/nav_k64"
  name "NAV K64 Template"
  desc "Az állami foglalkoztatási szerv adatszolgáltatása az álláskeresési ellátás folyósításának – jogosultságot kizáró kereső tevékenység miatti – megszüntetéséről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k64"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_k64.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K64*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K64 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
