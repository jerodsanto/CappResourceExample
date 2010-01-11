namespace :capp do
  namespace :link do

    desc 'symlink the development env'
    task :dev  => :environment do
      cmd = ["rm -f public", "ln -s #{Rails.root}/capp public"].join(" & ")
      system(cmd)
    end

    desc 'symlink the release env'
    task :release  => :environment do
      cmd = ["rm -f public", "ln -s #{Rails.root}/capp/Build/Release/AddressBook public"].join(" & ")
      system(cmd)
    end

  end
end
