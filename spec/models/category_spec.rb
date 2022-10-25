require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) do
    User.create(
      name: 'John',
      email: 'john1@gmail.com',
      password: '1234567'
    )
  end

  subject do
    Category.new(
      name: 'Food',
      icon: 'http://fasfa-utensils',
      description: 'Food expenses',
      user_id: user.id
    )
  end

  before { subject.save }

  describe 'valid attributes' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = 'Food'
      expect(subject).to be_valid
    end

    it 'is not valid without an icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = 'Food expenses'
      expect(subject).to be_valid
    end

    it 'is not valid without a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end
end
