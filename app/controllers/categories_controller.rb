class CategoriesController < ApplicationController
  def index
    @categories = Category.where(author_id: current_user.id)
    @category_totals = {}
    @categories.each do |category|
      category_transactions = category.transactions_list.order(created_at: :desc)
      total_amount = category_transactions.sum(:amount)
      @category_totals[category.id] = total_amount
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_transactions = @category.transactions_list.order(created_at: :desc)
    @total_amount = @category_transactions.sum(:amount)
  end

  def new
    @category = Category.new
    render :new
  end

  def create
    @category = Category.where(author_id: current_user.id).build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      flash.now[:alert] = "Error creating category: #{@category.errors.full_messages.join(', ')}"
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :details)
  end
end
