class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USER"], password: ENV["ADMIN_PASS"]
  def show
    @categories = Category.all.count
    @products = Product.all.count
  end
end