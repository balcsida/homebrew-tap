cask "anyk-21k92" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21k92/nav_21k92"
  name "NAV 21K92 Template"
  desc "A kifizető adatszolgáltatása a 2021. évi csereügyletből származó jövedelemről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21k92"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_21k92.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*21K92*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 21K92 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
