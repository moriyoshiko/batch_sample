class RanksUpdater
    def update_all
        Rank.transaction do
            # 現在のランキング情報をリセット
            Rank.delete_all
            # ユーザごとのスコア合計を降順に並べ替え、そこからランキング情報を再作成する
            create_ranks

            #意図的に例外発生
            # raise ActiveRecord::Rollback
        end
    end

    private

    # def create_ranks (順位を決める機能を担当する"RankOrderMaker"を呼び出す形式に変更)
    #     # ユーザごとにスコアの合計を計算する
    #     user_total_scores = User.all.map do |user|
    #         {user_id: user.id, total_score: user.user_scores.sum(&:score)}
    #     end
    # 
    #     #ユーザごとのスコアを降順に並べ替える
    #     sorted_total_score_groups = user_total_scores
    #                             .group_by { |score| score[:total_score]}
    #                             .sort_by  { |key, _| key * -1 }
    #                             .to_h
    #                             .values
    #     #ランキング作成
    #     sorted_total_score_groups.each.with_index(1) do |scores, idx|
    #         scores.each do |total_score|
    #             Rank.create(user_id: total_score[:user_id], rank: idx, score: total_score[:total_score])
    #         end
    #     end
    # end

    def create_ranks
        RankOrderMaker.new.each_ranked_user do |user, rank|
            Rank.create(user_id: user.id, rank: rank, score: user.total_score)
        end
    end
end