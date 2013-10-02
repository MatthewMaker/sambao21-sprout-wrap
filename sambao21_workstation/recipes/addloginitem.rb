
execute "install addLoginItem command" do
  command "wget https://github.com/downloads/pivotalexperimental/addLoginItem/addLoginItem -O #{Chef::Config[:file_cache_path]}/addLoginItem"
  user node['current_user']
  not_if { File.exists?("#{Chef::Config[:file_cache_path]}/addLoginItem") }
end


execute "copy addLoginItem to /usr/local/bin" do
  command "mv #{Chef::Config[:file_cache_path]}/addLoginItem #{Regexp.escape("/usr/local/bin/addLoginItem")}"
  user node['current_user']
  group "admin"
  only_if { !::File.exists?("/usr/local/bin/addLoginItem") }
end

file "/usr/local/bin/addLoginItem" do
  mode "755"
end
