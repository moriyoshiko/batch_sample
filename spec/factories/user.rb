FactoryBot.define do
    #usersテーブルのnameカラムに'test'文字列を設定
    factory :user do
        # name { 'test' }
        sequence(:name) { |n| "ゲームユーザ#{n}"}
    end
end