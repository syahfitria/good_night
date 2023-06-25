class UserFollowersController < ApplicationController
  protect_from_forgery with: :null_session

  def actions
    raise DuplicateRecordError unless check_follower?
    perform_actions
    render_json("User was " + params[:action_type], code: :ok)
  rescue 
    render_json("Something went wrong", code: :internal_server_error)
  end

  private
  def perform_actions
    case params[:action_type]
    when 'follow'
      follow
    when 'unfollow'
      unfollow
    end
  end
  
  def check_follower?
    if params[:action_type] == 'follow'
      UserFollower.where(user_id: params[:user_id], user_follower_id: params[:follower_id]).empty? 
    else
      return true
    end
  end
    
  def follow
    UserFollower.create!(
      user_id: params[:user_id].to_i,
      user_follower_id: params[:follower_id].to_i
    )
    
    rescue
      raise InvalidRecordError
  end
  
  def unfollow
    UserFollower.find_by(
      user_id: params[:user_id].to_i,
      user_follower_id: params[:follower_id].to_i
    ).destroy!
    

    rescue
      raise InvalidRecordError
  end

end