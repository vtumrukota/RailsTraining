require 'spec_helper'

RSpec.describe Article, :type => :model do
  it "Should have valid name, title and deleted properties" do
    a = Article.new(name: 'Vivek', title: 'This is a test obj', deleted: false)
    expect(a.save).to eq(true), "The record was not valid!"
  end

  it "Should not save records without the appropriate properties" do
    a = Article.new(title: 'This is a test obj', deleted: false)
    expect(a.save).to eq(false), "The record was not valid!"
  end

  it "The deleted? method should return the value of the records deleted property" do
    a = Article.new(name: 'Vivek', title: 'This is a test obj', deleted: false)
    expect(a.deleted?).to eq(false)
  end

  it "delete_record Should be able to change the deleted property on the record" do
    @b = FactoryGirl.create(:article)
    @b.delete_record
    expect(@b.deleted?).to eq(true)
  end

  it "Should return all records that are deleted" do
    a = FactoryGirl.create(:article)
    a.delete_record
    expect(Article.is_deleted(true)).to include(a)
  end

  it "Should return all the records that not-deleted" do
    a = FactoryGirl.create(:article)
    a.delete_record
    expect(Article.is_deleted(false)).not_to include(a)
  end

  it "It should duplicate a deleted Article into Deleted_Articles" do
    a = FactoryGirl.create(:article)
    a.delete_record
    n = DeletedArticle.last
    expect(a.title).to eq(n.title)
  end

  it "find_recent_ should not work when passed a non-integer" do
    expect(Article.find_recent_1a4d).to eq("Sorry, the find_recent_1a4d method doesn't exist!")
  end

  it "find_recent_x should return the correct amount of records" do
    a = FactoryGirl.create(:article)
    b = FactoryGirl.create(:article)
    expect(Article.find_recent_1).to include(b)
  end

end
