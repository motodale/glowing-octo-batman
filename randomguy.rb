
teamorder = []

puts "enter a name, if no name hit enter"
name = ''

while name != 'done'
  name = gets.chomp
  teamorder.push name
end
teamorder.pop
teams = teamorder.shuffle

p teams
