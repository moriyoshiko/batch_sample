# データのリセット(:restrict⇨子テーブルのデータを持っている親テーブルのデータを削除(更新)できない、:cascde⇨親テーブルの削除や更新に合わせて子テーブルも更新してくれる)
Rank.delete_all
User.delete_all

# # テストデータ　ユーザ情報
# user1 = User.create(id: 1, name: 'ゲーム太郎')
# user2 = User.create(id: 2, name: 'ゲーム花子')
# user3 = User.create(id: 3, name: 'ゲーム英吉')
# user4 = User.create(id: 4, name: 'ゲーム勇気')
# user5 = User.create(id: 5, name: 'ゲーム魔王')

# # テストデータ　ユーザごとの得点
# UserScore.create(user_id: user1.id, score: 3, received_at: Time.current)
# UserScore.create(user_id: user1.id, score: 4, received_at: Time.current)
# UserScore.create(user_id: user1.id, score: 1, received_at: Time.current)

# UserScore.create(user_id: user2.id, score: 2, received_at: Time.current)
# UserScore.create(user_id: user2.id, score: 2, received_at: Time.current)
# UserScore.create(user_id: user2.id, score: 4, received_at: Time.current)

# UserScore.create(user_id: user3.id, score: 1, received_at: Time.current)
# UserScore.create(user_id: user3.id, score: 1, received_at: Time.current)
# UserScore.create(user_id: user3.id, score: 1, received_at: Time.current)

# UserScore.create(user_id: user4.id, score: 0, received_at: Time.current)
# UserScore.create(user_id: user4.id, score: 1, received_at: Time.current)
# UserScore.create(user_id: user4.id, score: 0, received_at: Time.current)

# UserScore.create(user_id: user5.id, score: 3, received_at: Time.current)
# UserScore.create(user_id: user5.id, score: 3, received_at: Time.current)
# UserScore.create(user_id: user5.id, score: 3, received_at: Time.current)

#大量のテストデータ一括生成
user_amount = ENV['USER_AMOUNT'].to_i
# user_amount = '10'.to_i

User.transaction do
    1.upto(user_amount) do |i|
        user = User.create(id: i, name: "#{i}人目のゲームユーザー")
        #テストユーザごとの得点
        rand(30).times do
            UserScore.create(user_id: user.id, score: rand(1..100), received_at: Time.current.ago(rand(0..60).days))
        end
    end
end
