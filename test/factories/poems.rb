FactoryBot.define do
  factory :poem do
    title { "テストの詩" }
    content { "これはテストの詩です。" }
    aroma { "ラベンダー" }
    location { "公園" }
    association :user  # 🔥 `user` に紐づける
  end
end
