require 'sign_up_validator'

describe SignUpValidator do
  context '#password_valid?' 
  it 'checks that the two entered passwords match' do
    expect(described_class.password_valid?('secret', 'secret')).to eq true
    expect(described_class.password_valid?('secret', 'blah')).to eq false
  end
end
