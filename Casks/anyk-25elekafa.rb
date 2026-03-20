cask "anyk-25elekafa" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25ELEKAFA/nav_25elekafa"
  name "NAV 25ELEKAFA Template"
  desc "25ELEKAFA JELŰ NYOMTATVÁNY AZ ART. 185. § (1) BEKEZDÉSÉBEN MEGHATÁROZOTT ADÓALANYT AZ EURÓPAI KÖZÖSSÉG VALAMELY TAGÁLLAMÁBÓL MEGILLETŐ HOZZÁADOTTÉRTÉK-ADÓ VISSZATÉRÍTTETÉSÉHEZ"
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25ELEKAFA"

  depends_on cask: "anyk"

  preflight do
    config_file = "#{HOMEBREW_PREFIX}/etc/abevjavapath.cfg"
    unless File.exist?(config_file)
      odie "ÁNYK is not installed. Please install it first with: brew install --cask anyk"
    end

    system_command "/usr/bin/unzip",
                   args: ["-o", "-q", "#{staged_path}/nav_25elekafa.jar", "application/*", "-d", staged_path.to_s],
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
      Dir.glob("#{anyk_dir}/nyomtatvanyok/*25ELEKAFA*.tem.enyk").each do |f|
        FileUtils.rm_f(f)
      end
    end
  end

  caveats <<~EOS
    NAV 25ELEKAFA template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
