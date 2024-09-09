class BooksController < ApplicationController
  def index
    @books = Book.order(:title)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new()
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "The book was successfully created!"
      redirect_to(books_path)
    else
      flash[:alert] = "Failed to create book: #{@book.errors.full_messages.join(', ')}"
      render ('new')
    end
    
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "The book was successfully updated"
      redirect_to(books_path)
    else
      flash[:alert] = "Failed to update book: #{@book.errors.full_messages.join(', ')}"
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "The book was successfully deleted!"
    redirect_to(books_path)

  end

  private 

  def book_params
    params.require(:book).permit(:title, :price, :date, :author)
  end
end
