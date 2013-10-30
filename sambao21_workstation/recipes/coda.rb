
unless File.exists?("/Applications/Coda")
  dmg_package "Coda" do
    volumes_dir "Coda"
    source "https://panic.com/coda/d/Coda%202.0.11.zip"
    type "pkg"
    #checksum ""
    accept_eula true
    action :install
    owner node['current_user']
  end
end

