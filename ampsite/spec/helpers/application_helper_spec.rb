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

RSpec.describe ApplicationHelper, type: :helper do
  describe 'is_tube?' do
    context 'on a tube' do
      it "should return if an object is an instance of a tube" do
        tube = Triode.new
        expect(is_tube?(tube)).to eql(true)
      end
    end
  end


end