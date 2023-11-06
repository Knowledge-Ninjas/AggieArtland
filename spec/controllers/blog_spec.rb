require 'rails_helper'

RSpec.describe BlogController, type: :controller do
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
    describe 'GET #new' do
    #let(:user) { FactoryBot.create(:user) }

      it 'shows the blog' do
        get :new
        expect(response).to render_template(:new)
      end
    end
    

  describe 'GET #show' do
    #let(:user) { FactoryBot.create(:user) }
    
    context 'if blog exists' do
      before do
        #session[:user_id] = user.id
      end
    
      it 'shows blog post' do
        get :show, params: { id: user.id }
        expect(response).to render_template(:show)
      end
    end
    
    context 'if blog does not exist' do
      it 'redirects to the blog page' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_blog_path)
      end
    end
  end

end