desc "Build a specific box"
task :build, :box do |t, args|
  args.with_defaults(:box => 'centos-64-x64')
  box = args[:box]

  puts "Building #{box} ..."
  FileUtils.chdir "templates/#{box}" do
    system("packer build -only=virtualbox --force template.json")
  end
end
