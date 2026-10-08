cask "anyk-2065" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2065/NAV_2065"
  name "NAV 2065 Template"
  desc "2065 ÁFA BEVALLÁS (BEVALLÁS, ADATSZOLGÁLTATÁS)"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2065"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_2065.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*2065*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 2065 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
