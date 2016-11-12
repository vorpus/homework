# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # validations
 it { should validate_presence_of(:username) }

 # associations
 it { should have_many(:subs) }

 it { should validate_length_of(:password).is_at_least(6) }
 it { should have_many(:subs) }
 it { should have_many(:comments) }

 describe "#is_password" do
   it "doesn't accept short passwords" do
     u = User.new(username:"testing", password:"12345")
     expect(u.valid?).to be false
   end

   it "allows 6+ character passwords" do
     u = User.new(username:"testing", password:"123456")
     expect(u.valid?).to be true
   end
 end

 describe "#reset_session_token!" do
   it "changes a user's session token" do
     u = User.create(username:"testing", password:"123456")
     st = u.session_token
     u.reset_session_token!
     expect(u.session_token).not_to eq(st)
   end
 end

 describe "#find_by_credentials" do
   it "finds a user" do
     u = User.create(username:"testing", password:"123456")
     expect(User.find_by_credentials("testing", "123456")).to eq(u)
   end

   it "doesn't find anything for incorrect passwords" do
     u = User.create(username:"testing", password:"123457")
     expect(User.find_by_credentials("testing", "123456")).to eq(nil)
   end
 end
end
