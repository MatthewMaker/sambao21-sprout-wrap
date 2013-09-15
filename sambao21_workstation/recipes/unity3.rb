
#TODO if Applications/Unity exists, temporarily move it!

unless File.exists?("/Applications/Unity3.5.7")

  dmg_package "Unity" do
    volumes_dir "unity"
    source "http://download.unity3d.com/download_unity/unity-3.5.7.dmg"
    checksum "f4277807286bb012dd5a1e4898c8e71c7980f12bffc77a3ebc51b03be3e60ab1"
    type "pkg"
    accept_eula true
    action :install
    owner node['current_user']
    not_if File.exists?("/Applications/Unity-3.5.7")
  end


  # rename the install folder to /Applications/Unity3.5.7/
  ruby_block "Rename file" do
    block do
      ::File.rename('/Applications/Unity','/Applications/Unity3.5.7')
    end
  end

end

