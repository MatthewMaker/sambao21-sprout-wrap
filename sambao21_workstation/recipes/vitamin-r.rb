#cask for this app seems not to work (as of 20131005)
#include_recipe "homebrew::cask"
#homebrew_cask "vitamin-r"

unless File.exists?("/Applications/Vitamin-R 2.app")
  dmg_package "Vitamin-R 2" do
    dmg_name "Vitamin"
    volumes_dir "Vitamin-R"
    source "http://www.publicspace.net/download/Vitamin.dmg"
    checksum "9f59aba48547adb31672bbae7346e3546e47e1c9f97250f114321bd49f6b8e9a"
    accept_eula true
    action :install
    owner node['current_user']
  end
end

