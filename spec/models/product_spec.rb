require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create!(name: "Evergreen")
      @product = Product.create!(name: "Alocasia", description: "blah blah", image: "blah", price_cents: 2999, quantity: 6, category_id: @category.id)
    end
    
    it 'should not be valid without a name' do
      @product.name = nil
      expect(@product).to_not be_valid
    end
    it "should not be valid without a price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end
    it "should not be valid without a quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end
    it "should not be valid without a category" do
      @product.category = nil
      expect(@product).to_not be_valid
    end
      
  end
end