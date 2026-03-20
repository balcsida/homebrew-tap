cask "anyk-vpop-pmt17meg" do
  version :latest
  sha256 :no_check

  url "https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_PMT17MEG/VPOP_pmt17meg"
  name "NAV VPOP_PMT17MEG Template"
  desc " 
A pénzmosás és a terrorizmus
finanszírozása megelőzéséről és megakadályozásáról szóló 2017. évi LIII. törvény
42. § (2) bekezdésében meghatározott megkeresés teljesítésének megválaszolása
védelemmel ellátott elektronikus üzenet formájában a Pmt. hatálya alá tartozó
szolgáltatók számára "
  homepage "https://nav.gov.hu/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_vam/VPOP_PMT17MEG"

  depends_on cask: "anyk"

  preflight do
    config_file = "#{HOMEBREW_PREFIX}/etc/abevjavapath.cfg"
    unless File.exist?(config_file)
      odie "ÁNYK is not installed. Please install it first with: brew install --cask anyk"
    end

    system_command "/usr/bin/unzip",
                   args: ["-o", "-q", "#{staged_path}/VPOP_pmt17meg.jar", "application/*", "-d", staged_path.to_s],
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
      Dir.glob("#{anyk_dir}/nyomtatvanyok/*VPOP_PMT17MEG*.tem.enyk").each do |f|
        FileUtils.rm_f(f)
      end
    end
  end

  caveats <<~EOS
    NAV VPOP_PMT17MEG template has been installed automatically.
    Open ÁNYK and the template will be available.
  EOS
end
