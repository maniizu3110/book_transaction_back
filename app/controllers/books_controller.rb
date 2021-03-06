class BooksController < ApplicationController
    include CurrentUserConcern

    def create
        book = Book.create!(
          title: params['book']['title'],
          content: params['book']['content'],
          major: params['book']['major'],
          price: params['book']['price'],
          condition: params['book']['condition'],
          user_id: params['book']['userId']
        )
        render json: {book: book}
    end

    def index
        books = Book.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded books', data: books }
    end

    def show
        book = Book.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded the book', data: book }
    end

    def order
        books = Book.where(bought_user:params[:id]).order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded the history books', orders: books }
    end

    def complete
        book = Book.find(params[:id])
        book.complete = true
        book.bought_user = params[:book][:bought_user]
        if book.save
            render json: { status: 'SUCCESS', message: 'complete book transaction', data: book }
        else
            render json: { status: 'ERROR', message: 'Not complete', data: book.errors }
        end
    end

    def update
        book = Book.find(params[:id])
        book.content = params['book']['content']

        if book.save
            render json: { status: 'SUCCESS', message: 'Update the book', data: book }
        else
            render json: { status: 'ERROR', message: 'Not updated', data: book.errors }
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
    end

  
    
  end