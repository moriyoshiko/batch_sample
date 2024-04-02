class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, comment: 'ゲームのユーザ情報を管理するテーブル' do |t|
      t.string :name, null: false, comment: 'ユーザの名前'

      t.timestamps null: false
    end
  end
end
