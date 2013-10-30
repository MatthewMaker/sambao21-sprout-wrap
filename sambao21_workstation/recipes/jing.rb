
include_recipe "sambao21_workstation::addloginitem"

unless File.exists?("/Applications/Jing.app")

  dmg_package "Jing" do
    source "http://download.techsmith.com/jing/mac/jing.dmg"
    checksum "b026b02c7c5b1142a4cb266b9d31a60233817230ece7f56a7759ce8e5a57cb40"
    dmg_name "Jing"
    accept_eula true
    action :install
    owner node['current_user']
  end

end

# start up on login
execute "Start Jing automatically" do
    command "addLoginItem \"/Applications/Jing.app\""
    user node['current_user']
  returns [0, 126]  # 126 means it's already in there!
end

