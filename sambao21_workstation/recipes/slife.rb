
unless File.exists?("/Applications/Slife.app")
  execute "install my build of SLife.App" do
    command "git clone git@bitbucket.org:trip/slife_trip.git --branch dev --single-branch #{Chef::Config[:file_cache_path]}/slife_trip"
    user node['current_user']
  end

  execute "copy SLife app to /Applications" do
    command "mv #{Chef::Config[:file_cache_path]}/slife_trip/v2.6/Slife.app #{Regexp.escape("/Applications/Slife.app")}"
    user node['current_user']
    group "admin"
  end

  # start up on login
  execute "Start Slife automatically" do
    command "addLoginItem \"/Applications/Slife.app\""
    user node['current_user']
    returns [0, 126]  # 126 means it's already in there!
  end
end


