require 'rails_helper'

RSpec.describe Api::WishlistsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:property) { FactoryBot.create(:property) }
  let(:wishlist) { FactoryBot.create(:wishlist, user:, property:) }

  describe 'POST #create' do
    it 'creates a new wishlist' do
      post :create, params: { user_id: user.id, property_id: property.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a wishlist' do
      delete :destroy, params: { id: wishlist.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
