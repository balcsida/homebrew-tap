cask "anyk-20k95" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20K95/NAV_20K95"
  name "NAV 20K95 Template"
  desc "jelű, a kifizető adatszolgáltatása a magánszemély kérelmére kiadott – kamatjövedelemmel 
kapcsolatos – igazolásról "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20K95"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20K95.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20K95*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20K95 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
