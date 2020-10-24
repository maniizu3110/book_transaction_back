class RelationshipsController < ApplicationController

    include CurrentUserConcern
  
    def create
        user = User.find(params[:id])
        @current_user.following << user
        render json: {user: user, currentuser: @current_user}
    end
  

    def destroy
        relationship = Relationship.find_by(follower_id:@current_user.id,followed_id: params[:id])
        relationship.destroy
        render json: { status: 'SUCCESS', message: 'deleted relationship'}
    end

    def confirm?
        relationship = Relationship.find_by(follower_id:@current_user.id,followed_id:params[:id])
        if relationship
            render json: {following:true}
        else
            render json: {following:false}
        end
    end
end
