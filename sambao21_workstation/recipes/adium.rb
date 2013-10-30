include_recipe "homebrew::cask"
homebrew_cask "adium"

# start up on login
#execute "Start Adium automatically" do
#    command "addLoginItem \"/Applications/Adium.app\""
#    user node['current_user']
#  returns [0, 126]  # 126 means it's already in there!
#end
