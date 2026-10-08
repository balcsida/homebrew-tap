cask "anyk-visszka" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/VISSZKA/nav_visszka"
  name "NAV VISSZKA Template"
  desc "A 2025. adóévre várható fizetendő kiskereskedelmi adót meghaladóan megfizetett kiskereskedelmi adóelőleg visszatérítési kérelem"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/VISSZKA"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_visszka.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*VISSZKA*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV VISSZKA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
