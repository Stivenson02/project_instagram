require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        username: "Username",
        description: "MyText",
        phone_number: "Phone Number",
        avatar: "Avatar",
        user: nil
      ),
      Profile.create!(
        username: "Username",
        description: "MyText",
        phone_number: "Phone Number",
        avatar: "Avatar",
        user: nil
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
    assert_select "tr>td", text: "Avatar".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
