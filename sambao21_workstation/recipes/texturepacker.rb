
unless File.exists?("/Applications/TexturePacker.app")

  dmg_package "TexturePacker" do
    source "http://www.codeandweb.com/download/texturepacker/3.1.3/TexturePacker-3.1.3.dmg"
    checksum "e2382450085a2069a7426e1b984d1a2b11c2b834735bd8bc2fe283942a04e437"
    dmg_name "TexturePacker-3.1.3"
    accept_eula true
    action :install
    owner node['current_user']
  end

end

