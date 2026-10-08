cask "anyk-1910b" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/1910B/NAV_1910B"
  name "NAV 1910B Template"
  desc "Havi bevallás a baleseti adóról és annak önellenőrzéséről biztosítók részére"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/1910B"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_1910B.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*1910B*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 1910B template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
