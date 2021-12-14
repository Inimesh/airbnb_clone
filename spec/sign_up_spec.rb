require 'sign_up'

describe SignUp do
  describe '.password_valid?' do
    it 'checks that the two entered passwords match' do
      expect(described_class.password_valid?('secret', 'secret')).to eq true
      expect(described_class.password_valid?('secret', 'blah')).to eq false
    end
  end
end