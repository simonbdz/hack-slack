require 'colorize'
require_relative "timeline"

  def get_keypressed
    begin
      key = @ec2.describe_key_pairs()[0][:aws_key_name]
      if(key.nil?)
        @logger.error("No Key pair existing")
      end
      return key
      rescue RightAws::AwsError=>err
        self.error_ec2(err)
        return "r"
    end
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
puts
end

tl = Timeline.new


#tl.flush



system "clear"
print_logo

#pedir usuario
print "Introduzca usuario del canal slack PROMO 6 {HACK}: ".yellow
$user = gets.chomp
puts

system "clear"
print_logo
tl.refresh

tl.tweet
key = "r"
loop do
	if key == "t" then
		tl.tweet 
		system "clear"
		print_logo
		tl.refresh
	end
	if key == "r" then
		system "clear"
		print_logo 
		tl.refresh
		sleep 1 
	end
	
	key = get_keypressed
	
	exit if key == "s"

end
 
