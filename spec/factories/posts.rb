FactoryGirl.define do
  factory :post do
    attachment "MyString"
    content "MyText"
    user nil
  end
end
