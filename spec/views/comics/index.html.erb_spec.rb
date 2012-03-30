require 'spec_helper'

describe "comics/index" do
  before(:each) do
    assign(:comics, [
      stub_model(Comic,
        :domain => "Domain",
        :score => 1,
        :nsfw => false,
        :downs => 2,
        :reddit_url => "Reddit Url",
        :comic_url => "Comic Url",
        :title => "Title",
        :ups => 3
      ),
      stub_model(Comic,
        :domain => "Domain",
        :score => 1,
        :nsfw => false,
        :downs => 2,
        :reddit_url => "Reddit Url",
        :comic_url => "Comic Url",
        :title => "Title",
        :ups => 3
      )
    ])
  end

  it "renders a list of comics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Domain".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Reddit Url".to_s, :count => 2
    assert_select "tr>td", :text => "Comic Url".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
