require 'spec_helper'

describe Article::Cms::InterfaceContentText do
  fixtures :all

  context "saving" do
    it "should be possible to save blurb with empty content" do
      blurb = Article::Cms::InterfaceContentText.make!(:key => 'no_content_test')
      blurb.content = ''
      blurb.save.should be_true
    end
  end
end