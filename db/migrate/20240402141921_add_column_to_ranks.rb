class AddColumnToRanks < ActiveRecord::Migration[7.1]
  # def up
  #   add_column :ranks, :assigned_date, :date, null: false, comment: '順位を割り当てた日'
  #   add_index :ranks, :assigned_date, name: 'ranks_assigned_date_index' 
  #   remove_index :ranks, :user_id
  #   add_index  :ranks, :user_id, name: 'ranks_user_id_undex'
  # end

  # def down
  #   remove_column :ranks, :assigned_date, :date
  #   remove_index :ranks, :user_id
  #   add_index :ranks, :user_id, unique: true
  # end

  def change
    add_column :ranks, :assigned_date, :datetime, null: false, comment: '順位を割り当てた日'
    add_index :ranks, :assigned_date, name: 'ranks_assigned_date_index' 

    remove_foreign_key :ranks, :users
    remove_index :ranks, :user_id
    add_index :ranks, :user_id
    add_foreign_key :ranks, :users, column: :user_id, on_delet: :restrict, on_update: :restrict 

  end
end
