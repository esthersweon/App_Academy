# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    parent_comment_id 1
    link_id 1
    body "MyText"
  end
end
