require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(100) }
    it { should validate_presence_of(:icon) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_and_belong_to_many(:transactions_list).class_name('Transaction') }
  end
end
