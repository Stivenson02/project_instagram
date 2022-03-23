require 'rails_helper'

RSpec.describe "publication_contents/show", type: :view do
  before(:each) do
    @publication_content = assign(:publication_content, PublicationContent.create!(
      file: "File",
      description: "MyText",
      order: 2,
      type: "Type",
      publication: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/File/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(//)
  end
end
