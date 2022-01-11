class BooksController < ApplicationController


  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @books = Book.all
    # 3. データをデータベースに保存するためのsaveメソッド実行
  if  @book.save
    flash[:complete] = "successfully"
    # 4. 詳細画面へリダイレクト
    redirect_to "/books/#{@book.id}"
    #book_path(@book)
  else 
    render:index
  end
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

    if book.update(book_params)
      flash[:complete] = "successfully"
    redirect_to book_path(book.id)  
    else 
     @book = book

    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])  
    if book.destroy
     flash[:complete] = "successfully"
      redirect_to books_path
    else 
      render:index
    end
  end


    private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
