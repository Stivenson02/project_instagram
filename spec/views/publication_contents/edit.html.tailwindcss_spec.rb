require 'rails_helper'

RSpec.describe "publication_contents/edit", type: :view do
  before(:each) do
    @publication_content = assign(:publication_content, PublicationContent.create!(
      file: "MyString",
      description: "MyText",
      order: 1,
      type: "",
      publication: nil
    ))
  end

  it "renders the edit publication_content form" do
    render

    assert_select "form[action=?][method=?]", publication_content_path(@publication_content), "post" do

      assert_select "input[name=?]", "publication_content[file]"

      assert_select "textarea[name=?]", "publication_content[description]"

      assert_select "input[name=?]", "publication_content[order]"

      assert_select "input[name=?]", "publication_content[type]"

      assert_select "input[name=?]", "publication_content[publication_id]"
    end
  end
end
