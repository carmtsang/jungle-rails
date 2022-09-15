require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create!(name: "Evergreen")
      @product = Product.new(name: "Alocasia", description: "blah blah", image: "blah", price_cents: 2999, quantity: 6, category_id: @category.id)
    end
    
    it 'should not be valid without a name' do
      @product.name = nil
      @product.validate
  
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "should not be valid without a price" do
      @product.price_cents = nil
      @product.validate

      expect(@product.errors.full_messages).to include("Price is not a number")
    end
    it "should not be valid without a quantity" do
      @product.quantity = nil
      @product.validate
      
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "should not be valid without a category" do
      @product.category = nil
      @product.validate
      
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
      
  end
end