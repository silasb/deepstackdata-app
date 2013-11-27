class Api::V1::NotificationsController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.notifications.where(dismissed_at: nil)
  end

  def create
    @notification = Notification.find(params[:id])
    @notification.save
    render json: @notification
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.update_attributes(update_params)
    respond_with @notification.to_json
  end

  private

  def update_params
    params.require(:notification).permit(:dismissed_at, :message, :title)
  end
end
