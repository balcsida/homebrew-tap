cask "anyk-ksz" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/KSZ/NAV_KSZ"
  name "NAV KSZ Template"
  desc "Az adatlap a közreműködő szervezetek nyilvántartásba vételéhez lett rendszeresítve."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/KSZ"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_KSZ.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*KSZ*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV KSZ template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
