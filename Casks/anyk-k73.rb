cask "anyk-k73" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/K73/nav_k73"
  name "NAV K73 Template"
  desc "A kifizető adatszolgáltatása a magánszemélyek részére az adóévben kedvezményezett részesedéscsere révén juttatott értékpapírokról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/K73"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_k73.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K73*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K73 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
