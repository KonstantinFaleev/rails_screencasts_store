class CommentController < ApplicationController
  private

  def resource_params
    params.require(:resource).permit(:body, :user_id, :commentable_id, :commentable_type)
  end
end
