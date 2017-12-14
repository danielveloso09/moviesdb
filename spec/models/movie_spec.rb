require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { build(:movie, movie_attributes) }
  let(:movie_attributes) { valid_attributes }
  let(:valid_attributes) { { title: 'Movie Title', year: 2017 } }

  subject { movie }

  it 'should work' do
    expect(subject).to be_valid
  end

  context 'with a missing params' do
    let(:movie_attributes) {}

    it 'should not be valid' do
      expect(subject).to_not be_valid
      expect(subject.errors.messages).to include(:title)
      expect(subject.errors.messages).to include(:year)
    end
  end

  context 'if another movie in the database' do
    let(:other_movie) { described_class.create!(valid_attributes) }
    let(:movie_attributes) { other_movie.attributes }

    it 'should not be valid if a movie of the same name already exists' do
      expect(subject).to_not be_valid
    end
  end
end
