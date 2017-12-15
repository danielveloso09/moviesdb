require 'rails_helper'

RSpec.describe Actor, type: :model do
  let(:user) { FactoryBot.build :user }
  subject { user }

  it 'should work' do
    expect(subject).to be_valid
  end

  context 'should not work' do
    it 'email is blank' do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages).to include(:email)
    end

    it 'email is invalid' do
      subject.email = 'ola@ola'
      expect(subject).to_not be_valid
      expect(subject.errors.messages).to include(:email)
    end
  end
end
