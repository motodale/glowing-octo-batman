
teamorder = []

puts "enter a name, if no name hit enter"
name = ''

while name != 'done'
  name = gets.chomp
  teamorder.push name
end
teamorder.pop
teams = teamorder.shuffle
num = teams.size / 2
final = teams.each_slice(num).to_a

def coin
  side = rand(100)
  if side >= 50
    puts "team 1 gets blue and team 2 gets red"
  else
    puts "team 1 gets red and team 2 gets blue"
  end
end

p final
coin
