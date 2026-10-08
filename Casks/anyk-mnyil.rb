cask "anyk-mnyil" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/MNYIL/NAV_mnyil"
  name "NAV MNYIL Template"
  desc " Az adatlap a megkereső szervezet nyilatkozata mérséklési kérelem tárgyában, 
valamint
fizetési kedvezményi kérelem áttételére szolgál"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/MNYIL"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_mnyil.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*MNYIL*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV MNYIL template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
