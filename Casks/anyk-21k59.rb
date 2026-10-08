cask "anyk-21k59" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21k59/nav_21k59"
  name "NAV 21K59 Template"
  desc "Az önkéntes kölcsönös biztosító pénztár 2021. évi adatszolgáltatása"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/21k59"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_21k59.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*21K59*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 21K59 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
