require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'devise configuration' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6).is_at_most(128) }
  end
end
