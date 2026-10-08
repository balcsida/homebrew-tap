cask "anyk-22aeoi" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22AEOI/nav_22aeoi"
  name "NAV 22AEOI Template"
  desc "Adatszolgáltatás Jelentendő, valamint Nem dokumentált Pénzügyi Számlákról a pénzügyi számlákkal kapcsolatos információk nemzetközi automatikus cseréjéhez"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/22AEOI"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_22aeoi.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*22AEOI*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 22AEOI template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
