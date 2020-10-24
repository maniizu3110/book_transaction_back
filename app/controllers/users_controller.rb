class UsersController < ApplicationController
    include CurrentUserConcern
  
    def index
        users = User.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded users', data: users }
    end

    def show
        user = User.find(params[:id])
        books = user.books
        render json: { status: 'SUCCESS', message: 'Loaded the user', data: user, books: books}
    end

    def update
        user = User.find(params[:id])
        user.username = params['user']['username']
        user.major = params['user']['major']
        user.grade = params['user']['grade']
        user.profile = params['user']['profile']

        if user.save
            render json: { status: 'SUCCESS', message: 'Update the user', data: user, value:params['user']['username']  }
        else
            render json: { status: 'SUCCESS', message: 'Not updated', data: user.errors }
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end

    def following
        user  = User.find(params[:id])
        users = user.following
        render json: {status: 'success',users:users}
    end

    def followers
    user  = User.find(params[:id])
    users = user.followers
    render json: {status: 'success',users:users}
    end
  
    
  end