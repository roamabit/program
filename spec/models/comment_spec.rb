require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @comment = Comment.new(title: "A Great Title", body: "An interesting comment body", subject: "A tantalizing subject", user_id: 1, parent_id: 1)
  end
  
  it "requires a title" do
    @comment.title = nil  

    expect(@comment).not_to be_valid
  end
  
  it "requires a body" do
    @comment.body = nil

    expect(@comment).not_to be_valid
  end

  it "requires a subject" do
    @comment.subject = nil

    expect(@comment).not_to be_valid
  end

  it "is invalid without a user_id" do
    @comment.user_id = nil
    
    expect(@comment).not_to be_valid
  end

  it "is invalid without a parent_id" do
    @comment.parent_id = nil
    
    expect(@comment).not_to be_valid
  end


  
end
