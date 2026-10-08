cask "anyk-k75" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/K75/nav_k75"
  name "NAV K75 Template"
  desc "Az önkormányzati hivatal adatszolgáltatása a lakásbérbeadás alapjául szolgáló szerződés bérbeadó magánszemély (ideértve az Szja. tv. szerinti társasházat is) által történő megszüntetéséről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/K75"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_k75.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K75*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K75 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
