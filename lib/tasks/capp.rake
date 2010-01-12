namespace :capp do
  namespace :link do

    desc 'symlink the development env'
    task :dev do
      cmd = ["rm -f public", "ln -s capp public"].join(" & ")
      system(cmd)
    end

    desc 'symlink the release env'
    task :release do
      cmd = ["rm -f public", "ln -s capp/Build/Release/AddressBook public"].join(" & ")
      system(cmd)
    end

  end
end
