class UserController < ApplicationController

  private

  def resource_params
    params.require(:resource).permit(:login)
  end
end
