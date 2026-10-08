cask "anyk-20kisker" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20KISKER/NAV_20KISKER"
  name "NAV 20KISKER Template"
  desc "Bevallás a Járványügyi Alap feltöltését szolgáló kiskereskedelmi adóról és adóelőlegről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/20KISKER"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_20KISKER.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*20KISKER*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV 20KISKER template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
