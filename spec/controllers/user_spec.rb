require 'rails_helper'

RSpec.describe UsersController, type: :controller do
#   describe 'GET #index' do
#     it 'assigns all users to @users' do
#       user1 = FactoryBot.create(:user)
#       user2 = FactoryBot.create(:user)

#       get :index

#       expect(assigns(:users)).to eq([user1, user2])
#     end

#     it 'renders the index template' do
#       get :index

#       expect(response).to render_template(:index)
#     end
#   end

  describe 'GET #show' do
    let(:user) { FactoryBot.create(:user) }
    
    context 'when logged in' do
      before do
        # Simulate authentication by setting a user_id in the session
        session[:user_id] = user.id
      end
    
      it 'renders the show template' do
        get :show, params: { id: user.id }
        expect(response).to render_template(:show)
      end
    
      it 'assigns the requested user to @user' do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq(user)
      end
    end
    
    context 'when not logged in' do
      it 'redirects to the login page' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(login_path)
      end
    
      it 'sets a flash error message' do
        get :show, params: { id: user.id }
        expect(flash[:error]).to be_present
      end
    end
  end



  describe 'GET #new' do
    it 'assigns a new user to @user' do
      get :new

      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the new template' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { FactoryBot.attributes_for(:user) }

      it 'creates a new user' do
        expect {
          post :create, params: { user: valid_params }
        }.to change(User, :count).by(1)
      end

      it 'redirects to the home page' do
        post :create, params: { user: valid_params }

        expect(response).to redirect_to(map_path)
      end
    end
  end

  describe 'POST #toggle_admin' do
    let(:admin_user) { FactoryBot.create(:admin_user) }
    let(:non_admin_user) { FactoryBot.create(:user) }

    context 'when an admin is logged in' do
      before do
        session[:user_id] = admin_user.id
      end

      it 'revokes admin access for a user' do
        post :toggle_admin, params: { user_id: admin_user.id }
        expect(admin_user.reload.user_type).to be_nil
        expect(response).to redirect_to(admin_panel_users_path)
      end

      it 'grants admin access for a non-admin user' do
        post :toggle_admin, params: { user_id: non_admin_user.id }
        expect(non_admin_user.reload.user_type).to eq('admin')
        expect(response).to redirect_to(admin_panel_users_path)
      end
    end

    context 'when a non-admin is logged in' do
      let(:non_admin_user) { FactoryBot.create(:user) }

      before do
        session[:user_id] = non_admin_user.id
      end

      it 'does not allow a non-admin user to perform this action' do
        let(user_to_change) { FactoryBot.create(:user) } # Creating a regular user

        post :toggle_admin, params: { user_id: user_to_change.id }
        user_to_change.reload

        expect(user_to_change.user_type).not_to eq('admin')
        expect(response).to redirect_to(admin_panel_users_path)
        expect(flash[:notice]).to eq('You do not have permission to perform this action')
      end
    end
  end
  describe 'badges and stamps' do
    let(:user) { FactoryBot.create(:user) }
    let(:art_piece) { FactoryBot.create(:art_piece) }
    
    it 'has no stamps by default' do
      expect(user.get_earned_stamps().length()).to eq(0)
    end

    it 'does not have stamp for art piece' do
      expect(user.has_stamp(art_piece)).to eq(false)
    end

    it 'sets a stamp' do
      user.set_stamp(art_piece, true)
      expect(user.has_stamp(art_piece)).to eq(true)
    end

    it 'unsets a stamp' do
      user.set_stamp(art_piece, true)
      user.set_stamp(art_piece, false)
      expect(user.has_stamp(art_piece)).to eq(false)
    end

    it 'retrieves art piece as stamped' do
      user.set_stamp(art_piece, true)
      expect(user.get_earned_stamps().include?(art_piece)).to eq(true)
    end
  end

end