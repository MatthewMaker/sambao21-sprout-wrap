include_recipe "homebrew::cask"
homebrew_cask "synergy"

execute "Start Synergy automatically" do
    command "addLoginItem \"/Applications/Synergy.app\""
    user node['current_user']
  returns [0, 126]  # 126 means it's already in there!
end
