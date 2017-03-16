require 'rails_helper'

RSpec.describe "the signin process", :type => :feature do

  let(:user) { create(:user) }

  it "signs me in" do
    log_in(user)
    expect(page).to have_content 'Signed in successfully'
  end

end
