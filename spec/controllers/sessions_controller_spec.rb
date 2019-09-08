require 'rails_helper'
require 'spec_helper'

RSpec.describe Devise::SessionsController, type: :controller do
  @user = User.create(email: "email@password.ru", password: "password")

  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe '#create' do
    it 'sign in and redirect to root path' do
      post :create, params: {
        user: {
          email: "email@password.ru",
          password: "password"
        }
      }

      expect(response).to redirect_to root_path
      expect(controller.send(:current_user)).to eq User.find_by(email: "email@password.ru")
    end

    it 'if password incorrect do not redirect to root path' do
       post :create, params: {
        user: {
          email: "email@password.ru",
          password: "qwerty1235"
        }
      }

      expect(response).not_to redirect_to root_path
    end
  end

  describe "when the user is logged out" do
      it "should redirect to the start page" do
        delete :destroy, {}

      expect(response).to redirect_to root_path
      end
    end
end
