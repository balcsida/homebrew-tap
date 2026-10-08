cask "anyk-k950" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k950/nav_k950"
  name "NAV K950 Template"
  desc "A kifizető adatszolgáltatása a magánszemély kérelmére kiadott – kamatjövedelemmel kapcsolatos – igazolásról"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k950"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_k950.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K950*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K950 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
