require 'rails_helper'

RSpec.describe Actor, type: :model do
  let(:actor) { FactoryBot.build :user }
  subject { actor }

  it 'should work' do
    expect(subject).to be_valid
  end

  context 'should not work' do
    it 'first name is blank' do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages).to include(:first_name)
    end

    it 'last name is blank' do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages).to include(:last_name)
    end

    it 'birth_date is blank' do
      subject.birth_date = nil
      expect(subject).to_not be_valid
      expect(subject.errors.messages).to include(:birth_date)
    end

    it 'the birth_date is not valid' do
      subject.birth_date = Date.today

      expect(subject).to_not be_valid
      expect(subject.errors.messages).to include(:birth_date)
    end
  end
end
