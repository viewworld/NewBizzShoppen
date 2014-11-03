FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraphs }
    published true
  end

  factory :cms_article, class: Article::Cms, parent: :article do
  end

  factory :cms_main_page_article, class: Article::Cms::MainPageArticle, parent: :cms_article do
  end

  factory :cms_hint_article, class: Article::Cms::Hint, parent: :cms_article do
  end

  factory :cms_help_popup_article, class: Article::Cms::HelpPopup, parent: :cms_article do
  end

  factory :cms_interface_content_text_article, class: Article::Cms::InterfaceContentText, parent: :cms_article do
  end

  factory :news_article, class: Article::News, parent: :article do
  end

  factory :news_agent_article, class: Article::News::Agent, parent: :news_article do
  end

  factory :news_call_centre_article, class: Article::News::CallCentre, parent: :news_article do
  end

  factory :news_category_home_article, class: Article::News::CategoryHome, parent: :news_article do
  end

  factory :news_member_article, class: Article::News::Member, parent: :news_article do
  end

  factory :news_supplier_article, class: Article::News::Supplier, parent: :news_article do
  end
end
