cask "anyk-k100" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k100/NAV_k100"
  name "NAV K100 Template"
  desc "Az adókedvezményre jogosító igazolást kiállító szerv adatszolgáltatása a tartósan 
álláskereső, a gyermekgondozási díjban, gyermekgondozási segélyben, gyermeknevelési 
támogatásban részesülő magánszemély részére kiállított igazolásról."
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k100"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "NAV_k100.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K100*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K100 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
