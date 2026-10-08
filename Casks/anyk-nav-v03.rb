cask "anyk-nav-v03" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_V03/NAV_nav_v03"
  name "NAV NAV_V03 Template"
  desc "A nyomtatvány kitöltésével elektronikus úton kérelmezhető a regisztrált exportőrként 
történő nyilvántartásba vétel."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_V03"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_nav_v03.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*NAV_V03*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV NAV_V03 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
