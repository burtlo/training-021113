require 'spec_helper'

describe Article do
  
  let(:article) { Article.new }
  
  
  describe "#tag_list" do
    context "when the article has no tags" do
      it "has an emptry string" do
        expect(article.tag_list).to eq ""
      end
    end
    
    context "when the article has two tags" do
      it "has the two tags in the list" do
        article.tags.build name: "My Little Pony"
        article.tags.build name: "Transformers"
        
        expect(article.tag_list).to eq ""
      end
    end
  end
  
  
end