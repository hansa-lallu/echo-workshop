require 'echo'

describe Echo do
  describe '#repeat' do
    it 'takes a user input' do
      allow_any_instance_of(Echo).to receive(:gets).and_return('hello world')
      expect(subject.run).to eq('hello world')
    end
  end
end 


