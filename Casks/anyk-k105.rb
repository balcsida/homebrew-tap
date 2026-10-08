cask "anyk-k105" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k105/nav_k105"
  name "NAV K105 Template"
  desc "Az önkormányzati hivatal jegyzőjének adatszolgáltatása az Európai Unió más tagállamában illetőséggel rendelkező személy termőföld haszonbérbe adásából származó jövedelméről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k105"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_k105.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K105*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K105 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
