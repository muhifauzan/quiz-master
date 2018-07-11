class CreateApiV1Quizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :api_v1_quizzes do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
