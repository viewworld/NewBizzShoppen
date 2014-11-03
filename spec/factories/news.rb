FactoryGirl.define do
  factory :news, class: ::Article::News::Agent do
    key 'some_key'
    published true
    views_count 0
  end
end
