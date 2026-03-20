cask "anyk-2348" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2348/nav_2348"
  name "NAV 2348 Template"
  desc "Bevallás az ingatlannal rendelkező társaság külföldi tagjának a részesedése elidegenítésekor keletkező adókötelezettségéről, valamint a társaság jegyzett tőkéjének leszállításakor keletkező adókötelez"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/2348"

  depends_on cask: "anyk"

  preflight do
    config_file = "#{HOMEBREW_PREFIX}/etc/abevjavapath.cfg"
    unless File.exist?(config_file)
      odie "ÁNYK is not installed. Please install it first with: brew install --cask anyk"
    end

    system_command "/usr/bin/unzip",
                   args: ["-o", "-q", "#{staged_path}/nav_2348.jar", "application/*", "-d", staged_path.to_s],
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
      Dir.glob("#{anyk_dir}/nyomtatvanyok/*2348*.tem.enyk").each do |f|
        FileUtils.rm_f(f)
      end
    end
  end

  caveats <<~EOS
    NAV 2348 template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
