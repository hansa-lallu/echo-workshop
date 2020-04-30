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
  end

  describe '#run' do 
    it 'continues to prompt user for input ' do
      allow(STDIN).to receive(:gets).and_return('Hello, World')
      allow(echo).to receive(:loop).and_yield
      expect { echo.run }.to output('Say something: ').to_stdout
    end 
  end
end 


