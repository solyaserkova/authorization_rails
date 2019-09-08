require 'rails_helper'
require 'spec_helper'

RSpec.describe Devise::RegistrationsController, type: :controller do
  let(:email) { 'email@email.ru' }
  let(:password) { 'password' }

  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe '#create' do
    it "sign up and redirect to root path" do
      post :create, user: {
          email: email,
          password: password,
          password_confirmation: password
        }

      expect(response).to redirect_to root_path
      expect(controller.send(:current_user)).to eq User.find_by(email: email)
    end
  end
end
