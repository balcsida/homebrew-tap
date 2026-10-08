cask "anyk-fag01" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/fag01/NAV_fag01"
  name "NAV FAG01 Template"
  desc "Adatlap gazdasági társaság (egyéb gazdálkodó szervezet) fizetési könnyítésre 
és mérséklésre irányuló kérelmének elbírálásához"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/fag01"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_fag01.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*FAG01*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV FAG01 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
