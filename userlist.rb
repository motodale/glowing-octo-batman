require 'json'
require 'securerandom'

filename = "sites.txt"
a = []

f = File.open(filename, "r").each_line do |line|
 name = line.chomp
 pass = ([*(0..9), *('A'..'Z'), *('a'..'z'), '!', '@', '#', '$', '%', '&']-%w(I 1 O)).sample(16).shuffle.join
 @pass = pass
 a.push [name,@pass]
end

userpass = Hash[*a.flatten]
userpass.to_json


File.open("userpass.json","w") do |k|
  k.write(JSON.pretty_generate(userpass))
end
