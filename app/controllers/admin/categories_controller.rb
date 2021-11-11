class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USER"], password: ENV["ADMIN_PASS"]

  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :category], notice: 'Category created!'
    else
      render :new
    end
  end
end
