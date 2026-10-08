cask "anyk-nav-j40" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_J40/NAV_j40"
  name "NAV NAV_J40 Template"
  desc "Kérelem a Jöt. 18. § (12) bekezdése szerinti egy szállítmányra szóló 
jövedéki biztosíték teljesítésére"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/NAV_J40"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_j40.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*NAV_J40*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV NAV_J40 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
