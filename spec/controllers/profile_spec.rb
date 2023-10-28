require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
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
        session[:user_id] = user.id
      end
    
      it 'shows the user profile' do
        get :show, params: { id: user.id }
        expect(response).to render_template(:show)
      end
    end
    
    context 'when not logged in' do
      it 'redirects to the login page' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(login_path)
      end
    end
  end



  describe 'PUT #update' do
    let(:user) { FactoryBot.create(:user) } 

    #context 'with valid parameters' do
    #    before do
    #        session[:user_id] = user.id
    #      end
    #    it 'updates the user name' do
    #        put :update, params: { id: user.id, user: { 'name'=> 'New Name' } }

    #        user.reload
    #       expect(user.name).to eq('New Name')
    #    end
    #end

    context 'with invalid parameters' do
        before do
            session[:user_id] = user.id
          end
        it 'renders the edit template' do
            put :update, params: { id: user.id, user: { name: '' } }

            expect(response).to render_template(:edit)
        end
    end
  end

  describe 'GET #edit' do
    let(:user) { FactoryBot.create(:user) }
        
    context 'when logged in' do
        before do
        session[:user_id] = user.id
        end
    
        it 'shows the user profile edit' do
        get :edit, params: { id: user.id }
        expect(response).to render_template(:edit)
        end
    end
    
    context 'when not logged in' do
        it 'redirects to the login page' do
        get :edit, params: { id: user.id }
        expect(response).to redirect_to(login_path)
        end
    end
  end

end