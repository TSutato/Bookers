class BooksController < ApplicationController
  
  def create
    # １. データを新規登録するためのインスタンス作成
     @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    
    if @book.save
    redirect_to book_path(@book),  notice: "Book was successfully created."
    else
     @books = Book.all
     render "index"
    end
  end
  
  
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(params[:id]), notice: "Book was successfully updated."
    else
    render "edit"
    end
  
  end
    
  def destroy  
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
      
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
