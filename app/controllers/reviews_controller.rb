class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_book
    before_action :find_user, only: [:show]
    before_action :find_review, only: [:destroy]

    def new
        @reviews = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.book_id = @book.id
        @review.user_id = current_user.id

        if @review.save
            redirect_to book_path(@book)
        else
            render 'new'
        end
    end

    def show
        render 'new'
    end

    def destroy
        if current_user.id == @review.user_id
            @review.destroy
            redirect_to book_path(@book)
        end
    end


    private
        def review_params
            params.require(:review).permit(:comment)
        end

        def find_book
            @book = Book.find(params[:book_id])
        end

        def find_user
            @user = User.find(params[:user_id])
        end

        def find_review
            @review = Review.find(params[:id])
        end

end
