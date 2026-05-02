cask "anyk-10.-pÓtlap" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/10__POTLAP/NAV_10__potlap"
  name "NAV 10. PÓTLAP Template"
  desc "Bejelentkezési lap a cégbejegyzésre nem kötelezett jogi személyek, a jogi személyiséggel 
nem rendelkező egyéb társaságok és szervezetek részére"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/10__POTLAP"

  depends_on cask: "anyk"

  preflight do
    config_file = "#{HOMEBREW_PREFIX}/etc/abevjavapath.cfg"
    unless File.exist?(config_file)
      odie "ÁNYK is not installed. Please install it first with: brew install --cask anyk"
    end

    system_command "/usr/bin/unzip",
                   args: ["-o", "-q", "#{staged_path}/NAV_10__potlap.jar", "application/*", "-d", staged_path.to_s],
                   print_stderr: false

    anyk_dir = File.read(config_file).strip

    Dir.glob("#{staged_path}/application/**/*").each do |src|
      next if File.directory?(src)

      relative_path = src.sub("#{staged_path}/application/", "")
      dest = File.join(anyk_dir, relative_path)
      FileUtils.mkdir_p(File.dirname(dest))
      FileUtils.cp(src, dest)
    end
  end

  uninstall_preflight do
    config_file = "#{HOMEBREW_PREFIX}/etc/abevjavapath.cfg"
    if File.exist?(config_file)
      anyk_dir = File.read(config_file).strip
      Dir.glob("#{anyk_dir}/nyomtatvanyok/*10. PÓTLAP*.tem.enyk").each do |f|
        FileUtils.rm_f(f)
      end
    end
  end

  caveats <<~EOS
    NAV 10. PÓTLAP template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
