
unless File.exists?("/Applications/Unity")
  dmg_package "Unity" do
    volumes_dir "Unity Installer"
    source "http://download.unity3d.com/download_unity/unity-4.2.1.dmg"
    type "pkg"
    #checksum ""
    accept_eula true
    action :install
    owner node['current_user']
  end
end

# now rename the install folder to /Applications/Unity4.2.1/
#ruby_block "Rename file" do
#  block do
#    ::File.rename('/Applications/Unity','/Applications/Unity4.2.1')
#  end
#end

