require 'rails_helper'

RSpec.describe BlogController, type: :controller do
    post1 = nil
    post2 = nil
    post3 = nil
    before(:all) do
        BlogPost.destroy_all

        post1 = BlogPost.create( title: "post 1",
                    body: "first!")
        post2 = BlogPost.create( title: "idea",
                    body: "what if we didn't")
        post3 = BlogPost.create( title: "question",
                    body: "where is this damn piece??")
        
    end
    describe 'GET #index' do
    #let(:user) { FactoryBot.create(:user) }

      it 'shows the blog' do
        get :index
        expect(response).to render_template(:index)
      end
      it 'contains various blog posts' do
        get :index
        expect(assigns(:blog_posts)).to include(post1,post2,post3)
      end
    end
    

  describe 'GET #show' do
    #let(:user) { FactoryBot.create(:user) }
    
    context 'if blog exists' do
      it 'to show a blog post' do
        get :show, params: { id: post1.id }
        expect(response).to render_template(:show)
      end
      it 'to show the right blog post' do
        get :show, params: { id: post1.id }
        expect(assigns(:blog_post)).to eq(post1)
      end
    end
    
    context 'if blog does not exist' do
      it 'redirects to the blog page' do
        get :show, params: { id: 18248124 }
        expect(response).to redirect_to(blog_index_path)
      end
    end
  end

end