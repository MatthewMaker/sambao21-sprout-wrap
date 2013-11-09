
unless File.exists?("/Applications/Aptana Studio 3/AptanaStudio3.app")

  dmg_package "Aptana Studio 3" do
    source "http://download.aptana.com/studio3/standalone/3.4.2/mac/Aptana_Studio_3_Setup_3.4.2.dmg"
    checksum "26d40abf9152f16d8190a1968f16c0158a4992d28333351db6fa455af68958f4"
#    dmg_name "Aptana Studio 3"
    accept_eula true
    action :install
    owner node['current_user']
  end

  #hacky?
  # now copy the install folder to /Applications/Aptana Studio 3/
  ruby_block "Copy file" do
    block do
      ::Directory.copy('/Volumes/Aptana Studio 3/','/Applications/')
    end
  end
end

