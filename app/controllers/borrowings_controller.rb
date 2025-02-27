class BorrowingsController < ApplicationController
  def new
    @borrowing = Borrowing.new
    @books = Book.where(available: true)
  end

  def create
    @borrowing = Borrowing.new(borrowing_params)
    if @borrowing.save
      book = Book.find(@borrowing.book_id)
      book.update(available: false)
      redirect_to books_path
    else
      render :new
    end
  end

  def return
    @borrowing = Borrowing.find(params[:id])
    @borrowing.update(returned_at: Time.current)
    book = Book.find(@borrowing.book_id)
    book.update(available: true)
    redirect_to books_path
  end

  private

  def borrowing_params
    params.require(:borrowing).permit(:book_id, :borrower_name, :borrowed_at)
  end
end
