class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.author = current_user

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to category_path(@transaction.categories.first), notice: 'Transaction created successfully.' }
        format.json { render json: @transaction, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
        puts @transaction.errors.inspect

      end
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, category_ids: [])
  end
end
