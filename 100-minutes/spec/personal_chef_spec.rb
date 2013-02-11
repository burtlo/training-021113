require 'spec_helper'
require 'personal_chef'

describe PersonalChef do

  let(:chef) do 
    PersonalChef.new
  end

  describe "#default_toast_style" do

    it "should be sourdough" do
      expect(chef.default_toast_style).to eq "sourdough"
    end

    it "really should be sourdough" do
      expect(chef.default_toast_style).to eq "sourdough"
    end
  end

  describe "#make_milkshake" do
    it "should return the chef to be able to make more things" do
      result = chef.make_milkshake
      expect(result).to eq chef
    end

    it "should make a milkshake" do
      chef.should_receive(:puts).with("Make a milkshakes")
      chef.make_milkshake
    end
  end

  describe "#make_toast" do

    describe "with no parameters" do
      it "makes my default toast" do
        chef.should_receive(:puts).with("Making your sourdough toast!")
        chef.make_toast
      end
    end

    describe "with style of toast" do
      it "makes the style of toast I specify" do
        chef.should_receive(:puts).with("Making your unicorn jam toast!")
        chef.make_toast "unicorn jam"
      end
    end
    
  end
end
