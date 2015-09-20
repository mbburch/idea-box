require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) do
    Category.new(title: "Category")
  end

  it "is valid" do
    expect(category).to be_valid
  end

  it "is invalid without a title" do
    category.title = nil
    expect(category).to_not be_valid
  end

end