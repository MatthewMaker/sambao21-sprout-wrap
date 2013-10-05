
include_recipe "sambao21_workstation::addloginitem"

unless File.exists?("/Applications/MacBreakZ 5.app")

  dmg_package "MacBreakZ 5" do
    source "http://d3k6s0oeufjjjn.cloudfront.net/download0_d251e24/MacBreakZ5.dmg"
    checksum "7227daef36b947d653094f1042fe373e97d258ce7d7d54c4e4ad7ae1ff541bf7"
    dmg_name "MacBreakZ5"
    accept_eula true
    action :install
    owner node['current_user']
  end

end

  # this no longer works:
  # start up on login
  #execute "Start MacBreakZ automatically" do
  #  command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/MacBreakZ 5.app\"; \"Hide\" = 0; }'"
  #  user node['current_user']
  #end


# start up on login
execute "Start MacBreakZ automatically" do
    command "addLoginItem \"/Applications/MacBreakZ 5.app\""
    user node['current_user']
  returns [0, 126]  # 126 means it's already in there!
end

