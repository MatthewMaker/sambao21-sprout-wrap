
#appname = #{Regexp.escape("Carbon Copy Cloner.App")}

unless File.exists?("/Applications/Carbon Copy Cloner.App")
  remote_file "#{Chef::Config[:file_cache_path]}/ccc-3.5.3.zip" do
    source "http://www.bombich.com/software/download_ccc.php?v=3.5.3"
    owner node['current_user']
  end

  execute "unzip ccc-3.5.3.zip" do
    command "unzip #{Chef::Config[:file_cache_path]}/ccc-3.5.3.zip -d #{Chef::Config[:file_cache_path]}"
    user node['current_user']
  end

  execute "copy Carbon Copy Cloner app to /Applications" do
    command "mv #{Chef::Config[:file_cache_path]}/#{Regexp.escape("Carbon Copy Cloner.App")} #{Regexp.escape("/Applications/Carbon Copy Cloner.App")}"
    user node['current_user']
    group "admin"
  end

  ruby_block "test to see if Carbon Copy Cloner was installed" do
    block do
      raise "Carbon Copy Cloner not installed sucessfully" unless File.exists?("/Applications/Carbon Copy Cloner.App")
    end
  end
end

