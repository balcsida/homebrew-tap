cask "anyk-nav-igazol" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/igazol/NAV_igazol"
  name "NAV IGAZOL Template"
  desc "NAV certificate request form template for ÁNYK"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/igazol"

  depends_on cask: "anyk"

  preflight do
    # Check if ÁNYK is installed
    config_file = "#{HOMEBREW_PREFIX}/etc/abevjavapath.cfg"
    unless File.exist?(config_file)
      odie "ÁNYK is not installed. Please install it first with: brew install --cask anyk"
    end

    # Extract template files from JAR
    system_command "/usr/bin/unzip",
                   args: ["-o", "-q", "#{staged_path}/NAV_IGAZOL.jar", "application/*", "-d", staged_path.to_s]

    # Get ÁNYK installation directory and copy template files
    anyk_dir = File.read(config_file).strip

    # Copy template files to ÁNYK directories
    Dir.glob("#{staged_path}/application/**/*").each do |src|
      next if File.directory?(src)

      relative_path = src.sub("#{staged_path}/application/", "")
      dest = File.join(anyk_dir, relative_path)
      FileUtils.mkdir_p(File.dirname(dest))
      FileUtils.cp(src, dest)
    end
  end

  uninstall_preflight do
    # Remove template files from ÁNYK installation
    config_file = "#{HOMEBREW_PREFIX}/etc/abevjavapath.cfg"
    if File.exist?(config_file)
      anyk_dir = File.read(config_file).strip
      Dir.glob("#{anyk_dir}/nyomtatvanyok/NAV_IGAZOL*.tem.enyk").each do |f|
        FileUtils.rm_f(f)
      end
    end
  end

  caveats <<~EOS
    NAV IGAZOL template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
