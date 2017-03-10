require 'rails_helper'

RSpec.describe Post, type: :model do

  let (:posts) {Post.new}

  it "should be validate with the presence of :content" do
    should validate_presence_of(:content)
  end

  it "should be validate with the presence of :content" do
    should belong_to(:user)
  end

  it "should be validate with the length of :content" do
    should validate_length_of(:content).
      is_at_least(120).
      on(:create)
  end

  it "should return the correct sum" do
    expect(posts.calculation(4,5) {|a,b| a + b}).to eq(9)
  end


  it "should return the correct subtraction" do
    expect(posts.calculation(4,5) {|a,b| a - b}).to eq(-1)
  end

end
