require 'rails_helper'
require 'spec_helper'

RSpec.describe WelcomeController, type: :controller do

  describe 'when open http://localhost:3000/' do
    it 'redirect to login' do
      get :index, {}

      expect(response).to redirect_to new_user_session_path
    end
  end
end
