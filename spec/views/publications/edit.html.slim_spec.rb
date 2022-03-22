require 'rails_helper'

RSpec.describe "publications/edit", type: :view do
  before(:each) do
    @publication = assign(:publication, Publication.create!(
      name: "MyString",
      description: "MyText",
      type: "",
      user: nil
    ))
  end

  it "renders the edit publication form" do
    render

    assert_select "form[action=?][method=?]", publication_path(@publication), "post" do

      assert_select "input[name=?]", "publication[name]"

      assert_select "textarea[name=?]", "publication[description]"

      assert_select "input[name=?]", "publication[type]"

      assert_select "input[name=?]", "publication[user_id]"
    end
  end
end
