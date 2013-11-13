#!/usr/bin/env ruby
require 'csv'
require 'json'

filename = "site_username_pass.csv"

ary = []

CSV.foreach(filename, :headers => true) do |row|
	ary << row.to_hash
end 


ary.each do |row|
    row['password'] =  `openssl passwd -1 "#{row['password']}"`.chomp
    row['id'] = row['domain'].tr('.','_')
  begin
    row['ssl_cert'] = File.open("certs/#{row['domain']}.crt").read
    if File.exist?("certs/#{row['domain']}.cabundle")
      row['ssl_cert'] = row['ssl_cert'] + File.open("certs/#{row['domain']}.cabundle").read
    else 
      puts "no CA bundle for #{row['domain']}"
    end
    row['ssl_key'] = File.open("certs/#{row['domain']}.key").read
  rescue Errno::ENOENT
    puts "SSL cert not found for #{row['domain']}"
  end
end


ary.each do |row|
  file = File.open("data_bag/users/#{row['id']}.json",'a')
  file.write(JSON.pretty_generate(row)) 
  file.close
end






#{
#"id": "bankname",
#"user": "username",
#"password": "passwordhash",
#"ssl_cert": "content",
#"ssl_key": "content"
#}






