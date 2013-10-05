
execute "enable developer mode" do
  command "/usr/sbin/DevToolsSecurity -enable"
  not_if { system("/usr/sbin/DevToolsSecurity -status | grep -c --no-messages enabled") }
end

execute "add user to developer group" do
  command "/usr/sbin/dseditgroup -o edit -t group -a staff _developer"
  not_if { system("/usr/sbin/dseditgroup -q -o checkmember -t group -a staff _developer | grep -c --no-messages yes") }
end

