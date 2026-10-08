cask "anyk-2341" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2341/nav_2341"
  name "NAV 2341 Template"
  desc "Bevallás a társasházak, a magánalapítványok és a bizalmi vagyonkezelők részére a 2023. évi személyi jövedelemadóról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2341"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_2341.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2341*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2341 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
