cask "anyk-22t113" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22t113/nav_22t113"
  name "NAV 22T113 Template"
  desc "KÉRELEM a csoportos áfaalanyiság választására és a képviselő személyében bekövetkezett változásbejelentésre"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22t113"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_22t113.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*22T113*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 22T113 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
