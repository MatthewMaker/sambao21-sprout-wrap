
include_recipe "sambao21_workstation::unity3"

#Installs shader sources for Unity3
unless File.exists?("/Applications/Unity3.5.7/Shaders")
  remote_file "#{Chef::Config[:file_cache_path]}/builtin_shaders-3.5.7.zip" do
    source "http://download.unity3d.com/download_unity/builtin_shaders-3.5.7.zip"
    owner node['current_user']
  end

  execute "unzip builtin_shaders-3.5.7.zip" do
    command "unzip #{Chef::Config[:file_cache_path]}/builtin_shaders-3.5.7.zip -d #{Chef::Config[:file_cache_path]}/builtin_shaders-3.5.7"
    user node['current_user']
  end

  execute "copy shader sources to /Applications/Unity3.5.7/Sources" do
    command "mv #{Chef::Config[:file_cache_path]}/builtin_shaders-3.5.7 #{Regexp.escape("/Applications/Unity3.5.7/Shaders")}"
    user node['current_user']
    group "admin"
  end

  ruby_block "test to see if shader sources were installed" do
    block do
      raise "Unity3.5.7 shader sources were not installed" unless File.exists?("/Applications/Unity3.5.7/Shaders")
    end
  end
end

