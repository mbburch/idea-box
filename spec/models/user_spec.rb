require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(username: "MB", password: "secret")
  end

  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user.username = nil
    expect(user).to_not be_valid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).to_not be_valid
  end
end