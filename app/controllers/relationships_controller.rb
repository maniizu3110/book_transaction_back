class RelationshipsController < ApplicationController

    include CurrentUserConcern
  
    def create
        followed_user = User.find(params['data']['followedId'])
        following_user = User.find(params['data']['followingId'])
        following_user.following << followed_user
        render json: {followed_user: followed_user, following_user: following_user}
    end

    def indicate
        relationship = Relationship.find_by(follower_id:params['followingId'],followed_id:params['followedId'])
        render json: { status: 'SUCCESS', message: 'find relationship',data:relationship }
        
    end
  

    def destroy
        relationship = Relationship.find(params[:id])
        relationship.destroy
        render json: { status: 'SUCCESS', message: 'deleted relationship'}
    end

    def confirm?
        relationship = Relationship.find_by(follower_id:params['currentUserId'],followed_id:params['urlUserId'])
        if relationship
            render json: {relationship:relationship,following:true}
        else
            render json: {relationship:relationship,following:false}
        end
    end
end
