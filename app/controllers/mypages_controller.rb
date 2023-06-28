class MypagesController < ApplicationController
  before_action :correct_user
  def show
    @posts = Post.where(user_id: current_user.id)
    @posts_solved = Post.where('user_id = ? and state = ?', current_user.id , true)
    @posts_unsolved = Post.where('user_id = ? and state = ?', current_user.id , false)
    @responses = Post.joins(:responses).where(responses: { user_id: current_user.id }).uniq
    @notifications = Notification.where(target_id: current_user.id)
    @notifications.update_all(state: true)
    @mymaps = Mymap.where(user_id: current_user.id)
  end
  
  private
    
    def correct_user
      if request.referer == nil
        redirect_to root_url
        flash[:notice] = "Please log in."
      end
    end
end
