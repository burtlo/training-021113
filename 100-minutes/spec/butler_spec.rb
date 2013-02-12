require 'spec_helper'
require 'personal_chef'

describe Butler do

  describe "#open_door" do
    describe "when asked to open the 'front' door" do
      it "opens the front door" do
        butler = Butler.new
        butler.should_receive(:puts).with("Opening the Front Door SIRRRRRR!")
        butler.open_door("front")
      end
    end

    describe "when asked to open the 'back' door" do
      it "opens the back door" do
        butler = Butler.new
        butler.should_receive(:puts).with("Opening the Back Door SIRRRRRR!")
        butler.open_door("back")
      end
    end

    describe "when asked to open the :back door" do
      it "opens the back door" do
        butler = Butler.new
        butler.should_receive(:puts).with("Opening the Back Door SIRRRRRR!")
        butler.open_door(:back)
      end
    end

    describe "when asked to open the 'BACK' door" do
      it "opens the back door" do
        butler = Butler.new
        butler.should_receive(:puts).with("Opening the Back Door SIRRRRRR!")
        butler.open_door('BACK')
      end
    end
    
    describe "when asked to open the 'bathroom' door" do
      it "does not open the bathroom door" do
        butler = Butler.new
        butler.should_receive(:puts).with("I won't go in there SIRRRRRR!")
        butler.open_door("bathroom")
      end
    end

    describe "when asked to open the 'podbay' door" do
      it "does not open the podbay door" do
        butler = Butler.new
        butler.should_receive(:puts).with("I won't go in there SIRRRRRR!")
        butler.open_door("podbay ")
      end
    end
  end

end