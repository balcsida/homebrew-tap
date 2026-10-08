cask "anyk-k97" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k97/nav_k97"
  name "NAV K97 Template"
  desc "A tartós befektetésből származó jövedelemről a kifizető által teljesítendő adatszolgáltatás"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/k97"

  depends_on cask: "anyk"

  preflight_steps do
    run "/usr/bin/unzip",
        args:         ["-o", "-q", "nav_k97.jar", "application/*"],
        chdir:        "{{staged_path}}",
        must_succeed: false,
        print_stderr: false
    copy "application/.", "share/abevjava", target_base: :homebrew_prefix, recursive: true
  end

  uninstall_preflight_steps do
    remove "share/abevjava/nyomtatvanyok/*K97*.tem.enyk", base: :homebrew_prefix
  end

  caveats <<~EOS
    NAV K97 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
