
apptitle = "#{node['sprout']['fluid']['instances']['facebook']['apptitle']}"
basename = "#{node['sprout']['fluid']['instances']['facebook']['basename']}"

app_path = "#{apptitle}.app"
zipfile = "#{basename}.zip"

cache_path = Chef::Config[:file_cache_path]
zip_path = "#{cache_path}/#{zipfile}"
userscript_dir = "#{node['fluid']['datadir']}/#{apptitle}/Userscripts/"
userscript_file = "#{userscript_dir}/Userscripts.plist"

unless File.exists?("/Applications/#{app_path}")
  cookbook_file "#{zip_path}" do
    source zipfile
    owner node['current_user']
    mode "0664"
  end

  execute "unzip fluid app" do
    command "unzip -u #{zip_path} -d #{cache_path}/"
    user node['current_user']
    returns [0, 1]  # returning 1 is okay too
  end

  execute "copy fluid app to /Applications" do
    command "mv #{cache_path}/#{Regexp.escape("#{app_path}")} /Applications/"
    user node['current_user']
    group "admin"
  end
end

directory "#{node['fluid']['datadir']}/#{apptitle}" do
  action :create
  owner node['current_user']
  recursive true
end

directory userscript_dir do
  action :create
  owner node['current_user']
  recursive true
end

unless File.exists?("#{userscript_file}")
  cookbook_file "#{userscript_file}" do
    source "#{basename}-userscripts"
    owner node['current_user']
    mode "0664"
  end
end

