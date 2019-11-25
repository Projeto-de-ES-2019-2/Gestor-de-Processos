class CreateAdvogados < ActiveRecord::Migration[5.1]
  def change
    create_table :advogados do |t|
      t.string :nome
      t.string :n_OAB
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end