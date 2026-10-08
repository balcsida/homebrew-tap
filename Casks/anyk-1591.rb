cask "anyk-1591" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/1591/NAV_1591"
  name "NAV 1591 Template"
  desc " Bevallás a távközlési szolgáltatást nyújtók távközlési adójáról "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/1591"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_1591.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*1591*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 1591 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
