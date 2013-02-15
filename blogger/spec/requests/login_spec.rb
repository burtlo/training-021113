require 'spec_helper'


# let(:title) { 'Article Title' }
# let(:body) { 'Article Body' }
#
# def create_article(title,body)
#   click_link "Create An Article"
#   fill_in "Title", with: title
#   fill_in "Body", with: body
#   click_button "Create Article"
# end
#
# it "takes me to a magical place where I can make articles" do
#   visit "/articles"
#   create_article(title,body)
#   title_text = page.find(:xpath, '//h1').text
#   expect(title_text).to eq title
# end

describe "Logging In" do
  describe "when I visit the login page" do
    context "when logging with the correct username and password" do
      it "redirects me to the articles index" do

        visit "/login"
        fill_in "Username", with: "admin"
        fill_in "Password", with: "admin"
        click_button "Login"

        title_text = page.find(:xpath, '//h1').text
        expect(title_text).to eq "Articles"

      end
    end
  end

end