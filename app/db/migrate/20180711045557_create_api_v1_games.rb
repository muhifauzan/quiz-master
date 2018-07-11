class CreateApiV1Games < ActiveRecord::Migration[5.2]
  def change
    create_table :api_v1_games do |t|
      t.string :right
      t.string :wrong

      t.timestamps
    end
  end
end
