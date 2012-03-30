require 'spec_helper'

describe "comics/show" do
  before(:each) do
    @comic = assign(:comic, stub_model(Comic,
      :domain => "Domain",
      :score => 1,
      :nsfw => false,
      :downs => 2,
      :reddit_url => "Reddit Url",
      :comic_url => "Comic Url",
      :title => "Title",
      :ups => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Domain/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/2/)
    rendered.should match(/Reddit Url/)
    rendered.should match(/Comic Url/)
    rendered.should match(/Title/)
    rendered.should match(/3/)
  end
end
