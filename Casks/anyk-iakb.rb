cask "anyk-iakb" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/iakb/NAV_iakb"
  name "NAV IAKB Template"
  desc "Igazolás az adórendszeren kívüli bevétel összegéről"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/iakb"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_iakb.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*IAKB*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV IAKB template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
