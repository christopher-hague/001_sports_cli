class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.integer :wins
      t.integer :losses
      t.string :win_pct
      t.integer :pts
      t.string :ppg
      t.string :fg_pct
      t.string :fg_3pt_pct
      t.integer :reb
      t.string :reb_pg
      t.integer :off_reb
      t.string :off_reb_pg
      t.integer :ast
      t.string :ast_pg
      t.integer :tov
      t.string :tov_pg
      t.integer :stl
      t.string :stl_pg
    end
  end
end
