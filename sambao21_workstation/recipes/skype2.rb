
unless File.exists?("/Applications/Skype")
  dmg_package "Skype" do
    volumes_dir "Skype"
    source node['sprout']['skype2']['dmg']['source'] 
    #type "pkg"
    checksum node['sprout']['skype2']['dmg']['checksum']
    #accept_eula true
    action :install
    owner node['current_user']
  end
end

# start up on login
execute "Start Skype automatically" do
    command "addLoginItem \"/Applications/Skype.app\""
    user node['current_user']
  returns [0, 126]  # 126 means it's already in there!
end

