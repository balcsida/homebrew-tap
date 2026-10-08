cask "anyk-19k91" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/19K91/NAV_19K91"
  name "NAV 19K91 Template"
  desc "19K91 jelű, a kifizető adatszolgáltatása a magánszemély által átvállalt egyszerűsített 
közteherviselési kötelezettséggel összefüggésben a 2019. évben kifizetett összegről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/19K91"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_19K91.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*19K91*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 19K91 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
