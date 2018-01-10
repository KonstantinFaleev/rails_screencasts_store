class PositionController < ApplicationController

  private

  def resource_params
    params.require(:resource).permit(:item_id, :cart_id, :quantity)
  end
end
