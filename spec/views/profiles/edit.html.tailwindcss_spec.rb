require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      username: "MyString",
      description: "MyText",
      phone_number: "MyString",
      avatar: "MyString",
      user: nil
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[username]"

      assert_select "textarea[name=?]", "profile[description]"

      assert_select "input[name=?]", "profile[phone_number]"

      assert_select "input[name=?]", "profile[avatar]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
