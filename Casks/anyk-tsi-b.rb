cask "anyk-tsi-b" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/tsi_b/NAV_tsi_b"
  name "NAV TSI_B Template"
  desc "Bejelentőlap ingatlan sorozatjellegű értékesítéséhez kapcsolódó áfa-kötelezettség 
megállapításához"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/tsi_b"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_tsi_b.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*TSI_B*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV TSI_B template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
