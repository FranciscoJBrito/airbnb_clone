module Api
  class WishlistsController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      wishlist = Wishlist.create!(wishlist_params)

      render json: wishlist, status: :ok
    end

    def destroy
      wishlist = Wishlist.find(params[:id])
      wishlist.destroy
      head :no_content
    end

    private

    def wishlist_params
      params.permit(:user_id, :property_id)
    end
  end
end
