require 'colorize'
require_relative "timeline"

def get_keypressed
	system("stty raw -echo")
	t = STDIN.getc
	system("stty -raw echo")
	return t
end

def print_logo
puts"  $$$\\  $$$$$$\\  $$\\        $$$$$$\\   $$$$$$\\  $$\\   $$\\ $$$\\   "
puts" $$  _|$$  __$$\\ $$ |      $$  __$$\\ $$  __$$\\ $$ | $$  |\\_$$\\  "
puts" $$ |  $$ /  \\__|$$ |      $$ /  $$ |$$ /  \\__|$$ |$$  /   $$ | "
puts"$$$ |  \\$$$$$$\\  $$ |      $$$$$$$$ |$$ |      $$$$$  /    $$$\\ "
puts"\\$$ |   \\____$$\\ $$ |      $$  __$$ |$$ |      $$  $$<     $$  |"
puts" $$ |  $$\\   $$ |$$ |      $$ |  $$ |$$ |  $$\\ $$ |\\$$\\    $$ / "
puts" \\$$$\\ \\$$$$$$  |$$$$$$$$\\ $$ |  $$ |\\$$$$$$  |$$ | \\$$\\ $$$  | "
puts"  \\___| \\______/ \\________|\\__|  \\__| \\______/ \\__|  \\__|\\___/  "
end

tl = Timeline.new


#tl.flush

#pedir usuario

print_logo
puts "Introduzca usuario del canal slack PROMO 6 {HACK}\n".yellow
$user = gets.chomp



tl.tweet
key = "r"
loop do
	if key == "t" then
	tl.tweet 
	tl.refresh
	end
	tl.refresh if key == "r"
	key = get_keypressed
	exit if key == "s"
	
end
 
