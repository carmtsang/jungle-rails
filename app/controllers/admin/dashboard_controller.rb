class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  
  def show
    @counts = {
      product: Product.count(:id),
      category: Category.count(:id)
    }
  end
end
