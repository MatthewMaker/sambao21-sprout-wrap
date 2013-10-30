include_recipe "homebrew::cask"
homebrew_cask "lime-chat"

# start up on login
execute "Start LimeChat automatically" do
    command "addLoginItem \"/Applications/LimeChat.app\""
    user node['current_user']
  returns [0, 126]  # 126 means it's already in there!
end
