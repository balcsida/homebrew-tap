cask "anyk-idipl" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/IDIPL/NAV_idipl"
  name "NAV IDIPL Template"
  desc " Kérelem a diplomáciai képviseleteket és tagjaikat, nemzetközi szervezeteket 
és
tisztviselőiket, illetve a NATO-t, fegyveres erőket, nemzetközi katonai parancsnokságokat
és személyi állományukat megillető általános forgalmi adó és jövedéki adó mentesség
érvényesítéséhez "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/IDIPL"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_idipl.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*IDIPL*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV IDIPL template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
