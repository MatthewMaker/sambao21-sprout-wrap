
#TODO back up System keychain first?

['7998A308E14D6585E6C21E153A719FBA5AD34AD9',
 'B435D4E1119D1C6690A749EBB394BD637BA782B7',
 'F17F6FB631DC99E3A3C87FFE1CF1811088D96033'].each do |sha1|

  execute "remove bad certificate #{sha1}" do
    command "sudo security delete-certificate -Z #{sha1} /System/Library/Keychains/SystemRootCertificates.keychain"
    only_if { system("security find-certificate -a -Z | grep -c #{sha1}") }
  end
end

