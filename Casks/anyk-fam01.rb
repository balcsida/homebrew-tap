cask "anyk-fam01" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/fam01/NAV_fam01"
  name "NAV FAM01 Template"
  desc "Adatlap magánszemély (egyéni vállalkozó) fizetési könnyítésre és mérséklésre
irányuló kérelmének elbírálásához."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/fam01"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_fam01.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*FAM01*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV FAM01 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
