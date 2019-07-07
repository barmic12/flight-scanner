require 'rails_helper'

RSpec.describe 'Trips', type: :request do
  describe 'GET #index' do
    context 'as logged user' do
      it 'returns success status' do
        sign_in create(:user)
        get '/trips'
        expect(response).to have_http_status(:success)
      end
    end

    context 'as anonymous user' do
      it 'returns redirect status' do
        get '/trips'
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
