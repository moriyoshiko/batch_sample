class User < ApplicationRecord
    has_many :user_scores
    has_one :rank

    def total_score
        #インスタンス変数 ||=を使用すると処理結果のキャッシュを保持することができる
        @total_score ||= user_scores.sum(&:score)
    end
end