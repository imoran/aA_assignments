require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it 'renders new users template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "GET #create" do
    context 'with valid params' do
      it 'logs user in if user has been correctly verified' do
        get :create
        post :create, params: { user: { username: 'isis', password: '1234567' } }
        user = User.find_by(username: 'isis')
        expect(session[:session_token]).to eq(user.session_token)
      end

      it 'redirects user to links\' index page upon logging in' do
        expect(response).to redirect_to(links_url)
      end
    end

    context 'with invalid params' do
      it 'flashes an error if user has not been correctly verified' do
        get :create
        post :create, params: { user: { username: '', password: 'zzzzz' } }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end

      it 'renders the new template' do
        get :create
        expect(response).to render_template('new')
      end
    end
  end
end
