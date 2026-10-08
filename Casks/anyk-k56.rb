cask "anyk-k56" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k56/NAV_k56"
  name "NAV K56 Template"
  desc "Adatszolgáltatás a költségvetési támogatás igénybevételéhez felhasználható 
igazolás kiadásáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k56"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_k56.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K56*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K56 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
