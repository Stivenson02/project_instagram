require 'rails_helper'

RSpec.describe "publication_contents/index", type: :view do
  before(:each) do
    assign(:publication_contents, [
      PublicationContent.create!(
        file: "File",
        description: "MyText",
        order: 2,
        type: "Type",
        publication: nil
      ),
      PublicationContent.create!(
        file: "File",
        description: "MyText",
        order: 2,
        type: "Type",
        publication: nil
      )
    ])
  end

  it "renders a list of publication_contents" do
    render
    assert_select "tr>td", text: "File".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
