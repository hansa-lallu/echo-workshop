class Echo
  def prompt
    print "Say something: "
  end

  def input
    @input = STDIN.gets.chomp
  end

  def run
    loop do
      prompt
      input
      if @input == 'exit'
        print 'Goodbye'
        break
      end
    end
  end
end 


