require 'spec_helper'

describe "sellers/seller_products" do
   after(:all) do
    Product.delete_all
    User.delete_all
   end
   before(:each) do
     @request.env["devise.mapping"] = Devise.mappings[:user]
      FactoryGirl.create(:configuration_setting)
      @user = FactoryGirl.create(:user, role: 2, payment_method: true, confirmed_at: "2013-05-28 06:38:19.499604")
      @product = FactoryGirl.create(:product, user_id: @user.id)
      @user.confirm! # set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in @user
  end
  it "displays all the products" do
      assign(:products, Kaminari.paginate_array([FactoryGirl.create(:product), FactoryGirl.create(:product)]).page(1))
      render
      rendered.should include("canon")
  end
  #=============================fail case=====================================
  it "displays all the products" do
      assign(:products, Kaminari.paginate_array([FactoryGirl.create(:product), FactoryGirl.create(:product)]).page(1))
      render
      rendered.should_not include("canon")
  end
end

