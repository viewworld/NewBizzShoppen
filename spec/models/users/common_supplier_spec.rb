require 'spec_helper'

describe "CommonSupplier" do
  fixtures :all

  context "company unique category" do
    before(:all) do
      @supplier = User::Supplier.make!
    end

    it "marks the category as unique" do
      @supplier.company_unique_category.is_customer_unique.should be_true
    end

    it "creates unique category based on company name" do
      @supplier.company_unique_category.name.should == @supplier.company_name
    end

    it "makes supplier unique category marked as in tray" do
      @supplier.company_unique_category.in_tray.should be_true
    end

  end
end