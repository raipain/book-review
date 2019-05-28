class BooksController < ApplicationController
    before_action :authenticate_user!, :except => [:show, :index]
    before_action :find_book, only: [:show, :edit, :update, :destroy]
    
    def index
        @books = Book.all.order("created_at DESC")
    end

    def show 
        @categories = @book.categories
    end

    def new
        @book = current_user.books.build
    end
    
    def create
        @book = current_user.books.build(book_params)
        puts params[:category_ids]

        if @book.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
        if @book.user_id == current_user.id
            @categories = @book.categories.all
        else
            redirect_to book_path(@book)
        end
    end

    def update
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
            render 'edit'
        end
    end

    def destroy
        if @book.user_id == current_user.id
            @book.destroy
            redirect_to root_path
        else
            redirect_to book_path(@book)
        end
    end

    private
        def book_params
            params.require(:book).permit(:title, :description, :author, :category_ids => [])
        end

        def find_book
            @book = Book.find(params[:id])
        end
end
