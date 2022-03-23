require 'rails_helper'

RSpec.describe "publication_contents/new", type: :view do
  before(:each) do
    assign(:publication_content, PublicationContent.new(
      file: "MyString",
      description: "MyText",
      order: 1,
      type: "",
      publication: nil
    ))
  end

  it "renders new publication_content form" do
    render

    assert_select "form[action=?][method=?]", publication_contents_path, "post" do

      assert_select "input[name=?]", "publication_content[file]"

      assert_select "textarea[name=?]", "publication_content[description]"

      assert_select "input[name=?]", "publication_content[order]"

      assert_select "input[name=?]", "publication_content[type]"

      assert_select "input[name=?]", "publication_content[publication_id]"
    end
  end
end
