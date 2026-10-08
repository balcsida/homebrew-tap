cask "anyk-k109" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/K109/nav_k109"
  name "NAV K109 Template"
  desc "Adatszolgáltatás az adóévben rokkantsági járadékban, illetve fogyatékossági támogatásban részesülő természetes személy adatairól és az ellátás folyósításának időszakáról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/K109"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_k109.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K109*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K109 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
