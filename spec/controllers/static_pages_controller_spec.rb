require 'spec_helper'

describe StaticPagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'introduce'" do
    it "returns http success" do
      get 'introduce'
      response.should be_success
    end
  end

  describe "GET 'grow'" do
    it "returns http success" do
      get 'grow'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

end
