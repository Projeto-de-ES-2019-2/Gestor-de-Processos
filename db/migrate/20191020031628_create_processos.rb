class CreateProcessos < ActiveRecord::Migration[5.1]
  def change
    create_table :processos do |t|
      t.string :cliente
      t.string :ex_adversa
      t.string :natureza
      t.string :assunto
      t.string :tipo_acao
      t.string :juizo
      t.string :num_processo
      t.date :ultimo_contato_cliente
      t.date :contato_agendado
      t.references :advogado, foreign_key: true

      t.timestamps
    end
  end
end
