require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'must be created with a matching password and password confirmation'
    it 'should not be valid if without a first name'
    it 'should not be valid if without a last name'
    it 'should not be valid if without an email'
    it 'should have an email that is unique'

  end
end
