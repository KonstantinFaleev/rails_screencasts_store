class OrderController < ApplicationController

  private

  def resource_params
    params.require(:resource).permit(:user, :user_id)
  end
end
