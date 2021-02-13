class BooksController < ApplicationController



  def index
    @book = Book.new
    @books = Book.all.order(created_at: :desc)

  end

  def create
    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book), notice:"Book was successfully created."
    else
      @books = Book.all.order(created_at: :desc)
       render action: :index
    end
  end

  def new
    @book = Book.new(book_params)
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book:id)
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path, notice: 'Book was successfully destroyed.'
    end
  end

private
def book_params
  params.require(:book).permit(:title, :body)
end


end
