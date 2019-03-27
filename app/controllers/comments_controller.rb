class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    Comment.create(chirp_id: params[:chirp_id],
                    content: params[:content])
    flash[:success] = "Comment Added!"
    redirect_to "/chirps/#{params[:chirp_id]}"
  end

  def destroy
    Comment.find(params[:comment_id]).destroy
    flash[:success] = "Comment destroyed!"

    redirect_to "/chirps/#{params[:chirp_id]}"
    
  end
end
