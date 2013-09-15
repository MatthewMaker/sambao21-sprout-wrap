
include_recipe "sambao21_workstation::unity4"

#Installs shader sources for Unity4
unless File.exists?("/Applications/Unity/Shaders")
  remote_file "#{Chef::Config[:file_cache_path]}/builtin_shaders-4.2.1.zip" do
    source "http://download.unity3d.com/download_unity/builtin_shaders-4.2.1.zip"
    owner node['current_user']
  end

  execute "unzip builtin_shaders-4.2.1.zip" do
    command "unzip #{Chef::Config[:file_cache_path]}/builtin_shaders-4.2.1.zip -d #{Chef::Config[:file_cache_path]}/builtin_shaders-4.2.1"
    user node['current_user']
  end

  execute "copy shader sources to /Applications/Unity/Sources" do
    command "mv #{Chef::Config[:file_cache_path]}/builtin_shaders-4.2.1 #{Regexp.escape("/Applications/Unity/Shaders")}"
    user node['current_user']
    group "admin"
  end

  ruby_block "test to see if shader sources were installed" do
    block do
      raise "Unity4 shader sources were not installed" unless File.exists?("/Applications/Unity/Shaders")
    end
  end
end

