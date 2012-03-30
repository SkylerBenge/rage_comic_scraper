require 'spec_helper'

describe "comics/new" do
  before(:each) do
    assign(:comic, stub_model(Comic,
      :domain => "MyString",
      :score => 1,
      :nsfw => false,
      :downs => 1,
      :reddit_url => "MyString",
      :comic_url => "MyString",
      :title => "MyString",
      :ups => 1
    ).as_new_record)
  end

  it "renders new comic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comics_path, :method => "post" do
      assert_select "input#comic_domain", :name => "comic[domain]"
      assert_select "input#comic_score", :name => "comic[score]"
      assert_select "input#comic_nsfw", :name => "comic[nsfw]"
      assert_select "input#comic_downs", :name => "comic[downs]"
      assert_select "input#comic_reddit_url", :name => "comic[reddit_url]"
      assert_select "input#comic_comic_url", :name => "comic[comic_url]"
      assert_select "input#comic_title", :name => "comic[title]"
      assert_select "input#comic_ups", :name => "comic[ups]"
    end
  end
end
