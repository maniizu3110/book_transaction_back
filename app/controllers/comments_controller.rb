class CommentsController < ApplicationController
    include CurrentUserConcern

    def create
        comment = Comment.create!(
          content: params['comment']['content'],
          book_id: params['comment']['book_id'],
          user_id: session[:user_id],
          username: User.find(session[:user_id]).username
        )
        render json: {comment: comment}
    end

    def show
        comments = Comment.where(book_id:params[:id]).order(created_at: :asc)
        render json: { status: 'SUCCESS', message: 'Loaded books', comments: comments }
    end


    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
    end


  
    
  end