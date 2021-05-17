require 'rails_helper'

RSpec.describe 'AccountActivations', type: :request do
  describe 'GET root_url' do 
    let!(:user) { User.create(email: 'test@example.com', 
                              password: 'password',
                              password_confirmation: 'password',
                              name: 'Example User', 
                              activated: false) }

    context 'when account is not validated' do 
      it 'redirects to login page' do 
        post login_path, params: { session: { email: user.email, password: user.password } }

        expect(flash.empty?).to eq false
        expect(response).to redirect_to(login_path)
      end
    end

    context 'when account is validated' do 
      it 'redirects to root page' do 
        user.update_attribute(:activated, true)
        post login_path, params: { session: { email: user.email, password: user.password } }

        expect(flash.empty?).to eq true
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
