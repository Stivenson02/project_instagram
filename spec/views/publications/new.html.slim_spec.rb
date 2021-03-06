require 'rails_helper'

RSpec.describe "publications/new", type: :view do
  before(:each) do
    assign(:publication, Publication.new(
      name: "MyString",
      description: "MyText",
      type: "",
      user: nil
    ))
  end

  it "renders new publication form" do
    render

    assert_select "form[action=?][method=?]", publications_path, "post" do

      assert_select "input[name=?]", "publication[name]"

      assert_select "textarea[name=?]", "publication[description]"

      assert_select "input[name=?]", "publication[type]"

      assert_select "input[name=?]", "publication[user_id]"
    end
  end
end
