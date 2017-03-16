require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "should has many comments" do
    should have_many(:comments)
  end

end
