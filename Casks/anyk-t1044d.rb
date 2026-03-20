cask "anyk-t1044d" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1044D/nav_t1044d"
  name "NAV T1044D Template"
  desc "Bejelentő és változásbejelentő lap az Art. 1. számú mellékletének 14. pontja alapján az iskolaszövetkezet biztosítottnak nem minősülő, a szövetkezetekről szóló 2006. évi X. törvény 10/B. § (2) bekezdé"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/T1044D"

  depends_on cask: "anyk"

  preflight do
    config_file = "#{HOMEBREW_PREFIX}/etc/abevjavapath.cfg"
    unless File.exist?(config_file)
      odie "ÁNYK is not installed. Please install it first with: brew install --cask anyk"
    end

    system_command "/usr/bin/unzip",
                   args: ["-o", "-q", "#{staged_path}/nav_t1044d.jar", "application/*", "-d", staged_path.to_s],
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
      Dir.glob("#{anyk_dir}/nyomtatvanyok/*T1044D*.tem.enyk").each do |f|
        FileUtils.rm_f(f)
      end
    end
  end

  caveats <<~EOS
    NAV T1044D template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
