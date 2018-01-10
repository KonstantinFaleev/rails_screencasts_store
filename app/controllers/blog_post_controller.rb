class BlogPostController < ApplicationController

  private

  def resource_params
    params.require(:resource).permit(:title, :body)
  end
end
