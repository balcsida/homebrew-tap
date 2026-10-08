cask "anyk-23kata" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/23KATA/nav_23kata"
  name "NAV 23KATA Template"
  desc "Nyilatkozat és bevallás kisadózók részére a 2023. évre"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/23KATA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_23kata.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*23KATA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 23KATA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
