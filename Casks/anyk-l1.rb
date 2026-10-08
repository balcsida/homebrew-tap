cask "anyk-l1" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/l1/NAV_l1"
  name "NAV L1 Template"
  desc "Adatlap a közigazgatási hatósági, bírósági eljárási illeték leletezéséhez"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/l1"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_l1.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*L1*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV L1 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
