require 'echo'

describe Echo do
  subject(:echo) { described_class.new }
  describe '#prompt' do
    it 'prompts a user to say something' do
      expect { echo.prompt }.to output('Say something: ').to_stdout
    end
  end

  describe '#input' do
    it 'outputs the input from user' do
      allow(STDIN).to receive(:gets).and_return('Hello World')
      expect(echo.input).to eq('Hello World')
    end

    it 'outputs the phrase and time entered' do
      time = Time.new(2020, 0o4, 30, 20, 45, 2, '+00:00')
      allow(Time).to receive(:now).and_return(time)
      allow(STDIN).to receive(:gets).and_return('Hello, World')
      echo.input
      expect { echo.say_something }.to output("2020-04-30 | 20:45 | You said: 'Hello, World'!\n").to_stdout
    end
  end

  describe '#run' do 
    it 'continues to prompt user for input ' do
      time = Time.new(2020, 0o4, 30, 20, 45, 2, '+00:00')
      allow(Time).to receive(:now).and_return(time)

      allow(STDIN).to receive(:gets).and_return('Hello, World')
      allow(echo).to receive(:loop).and_yield
      expect { echo.run }.to output("Say something: 2020-04-30 | 20:45 | You said: 'Hello, World'!\n").to_stdout
    end 
  end
end 


