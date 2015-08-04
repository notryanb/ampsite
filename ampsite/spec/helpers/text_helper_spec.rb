require 'spec_helper'
require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TopicsHelper. For example:
#
# describe TopicsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe TextHelper, type: :helper do
  describe 'has_spaces?' do

      it "should return a boolean if a string has spaces" do
        test_string = "www.This string should return true.com"
        expect(has_spaces?(test_string)).to eql(true)
      end

      it "should return a boolean if a string has spaces" do
        test_string = "www.nospaces.com"
        expect(has_spaces?(test_string)).to eql(false)
      end


  end

  describe 'format_url_tags?' do

      it "should return a boolean if a string has spaces" do
        test_input = "[url]www.thisshouldbegood.com[/url]"
        text = Post.new(title: "test", content: test_input)
        test_output = "<a href=\"https://www.thisshouldbegood.com\">www.thisshouldbegood.com</a>"
        expect(text.format_url_tags).to eql(test_output)
      end

    end




end