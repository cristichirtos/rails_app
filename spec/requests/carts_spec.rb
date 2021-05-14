require 'rails_helper'

RSpec.describe 'Carts', type: :request do
  describe 'POST /add_to_cart' do 
    let!(:product) { Product.create(title: 'Test', description: 'Test', price: 4) }

    context 'when not logged in' do 
      it 'redirects to login page' do 
        post add_to_cart_path(product.id)

        expect(flash.empty?).to eq false
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
