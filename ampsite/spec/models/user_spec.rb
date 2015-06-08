require 'spec_helper'
require 'rails_helper'
 
describe 'User' do
  describe "Validations" do
    context "on a new user" do
      it "should not be valid without a password" do
        user = User.new password: nil, password_confirmation: nil
        expect(user).not_to be_valid
      end
 
          it "should be not be valid with a short password" do
            user = User.new password: 'short', password_confirmation: 'short' 
            expect(user).not_to be_valid
          end
      
          it "should not be valid with a confirmation mismatch" do
            user = User.new password: 'short', password_confirmation: 'long'
            expect(user).not_to be_valid
          end
        end
      
        context "on an existing user" do
          let(:user) { User.create username: "thisisanothertest", email: "anotherfake@mail.com", password: 'password', password_confirmation: 'password' }
      
          it "should be valid with no changes" do
            expect(user).to be_valid
          end
      
          it "should not be valid with an empty password" do
            user.password = user.password_confirmation = ""
            expect(user).not_to be_valid
          end
      
          it "should be valid with a new (valid) password" do
            user.password = "new password"
            user.password_confirmation = "new password"
            expect(user).to be_valid
          end
    end
  end
end