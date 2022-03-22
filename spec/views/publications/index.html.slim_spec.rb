require 'rails_helper'

RSpec.describe "publications/index", type: :view do
  before(:each) do
    assign(:publications, [
      Publication.create!(
        name: "Name",
        description: "MyText",
        type: "Type",
        user: nil
      ),
      Publication.create!(
        name: "Name",
        description: "MyText",
        type: "Type",
        user: nil
      )
    ])
  end

  it "renders a list of publications" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
