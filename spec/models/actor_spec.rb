require 'rails_helper'

RSpec.describe Actor, type: :model do
  it 'should work' do
    birth_date = 7.days.ago
    actor = Actor.new(
      first_name: 'First Name',
      last_name: 'Last Name',
      birth_date: birth_date
    )
    expect(actor).to be_valid
  end

  context 'should not work' do
    before do
      @actor = Actor.new
    end

    it 'there are missing parameters' do
      expect(@actor).to_not be_valid
      expect(@actor.errors.messages).to include(:first_name)
      expect(@actor.errors.messages).to include(:last_name)
      expect(@actor.errors.messages).to include(:birth_date)
    end

    it 'the birth_date is not valid' do
      @actor.first_name = 'First Name'
      @actor.last_name = 'Last Name'
      @actor.birth_date = Date.today

      expect(@actor).to_not be_valid
      expect(@actor.errors.messages).to include(:birth_date)
    end
  end
end
