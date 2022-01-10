class BooksController < ApplicationController


  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # 4. 詳細画面へリダイレクト
    redirect_to "/books/#{@book.id}"
    #book_path(@book)
  end


  def index
       @book = Book.new
       @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)  
  end

  def destroy
    book = Book.find(params[:id])  
    book.destroy  
    redirect_to books_path
  end


    private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
