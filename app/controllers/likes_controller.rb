class LikesController < ApplicationController

  def index
    @likes = current_user.likes.map(&:property)
    render json: @likes, status: :ok
  end

  def create 
    @like = current_user.likes.new(like_params)
    if @like.save
      return render json: @like, status: :created
    else
      return render json: @like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    render json: @like, status: :ok # return the deleted like
  end

  private
  def like_params
    params.require(:like).permit(:property_id)
  end
end
