require 'spec_helper'

describe AzzemblyController do

  describe "GET 'portal'" do
    it "should be successful" do
      get 'portal'
      response.should be_success
    end
  end

end
