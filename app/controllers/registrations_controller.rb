
class RegistrationsController < ApplicationController
    def create
      user = User.create!(
        email: params['user']['email'],
        password: params['user']['password'],
        password_confirmation: params['user']['password_confirmation'],
        username: params['user']['username'],
        major: params['user']['major'],
        grade: params['user']['grade'],
      )
  
      if user
        session[:user_id] = user.id
        render json: {
          status: :created,
          user: user
        }
      else
        render json: { status: 500 }
      end
    end
  end