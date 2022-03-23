require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      username: "Username",
      description: "MyText",
      phone_number: "Phone Number",
      avatar: "Avatar",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Avatar/)
    expect(rendered).to match(//)
  end
end
