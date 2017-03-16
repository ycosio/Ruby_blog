require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  context "user authenticate" do
    #before(:each) do
     #@user = create(:user)
    #end

    let(:user) { create(:user) }

    let(:wrong_user) { build(:wrong_user) }

    it "sould be user authenticate" do
      should use_before_action(:authenticate_user!)
    end

    it "should not have a authenticate user" do
      if User.find_by(email: wrong_user.email) and User.last.valid_password? '111111'
        sign_in(wrong_user)
      end
      should_not set_session
    end

    it "should have a authenticate user" do
      if User.find_by(email: user.email) and User.last.valid_password? '111111'
        sign_in(user)
      end
      should set_session
    end
  end

  context 'GET #index' do
    before {get :index}

    it "should return all posts" do
      assert_equal Post.all, assigns(:posts)
    end

    it "should redirect to index" do
     should render_template('index')
    end
  end

end
