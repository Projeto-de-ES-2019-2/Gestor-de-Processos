class Processo < ApplicationRecord
  has_many :historicos
  belongs_to :advogado

  validates :num_processo, presence: true
  validates :cliente, presence: true

  def self.search (query)
    where("num_processo like ?", "%#{query}%")
  end
  #validates :cliente, presence: true, length:  {minimum: 4}
  #validates :ex_adversa, presence: true, length:  {minimum: 5}
  #validates :natureza, presence: true, length:  {minimum: 5}
  #validates :assunto, presence: true, length:  {minimum: 5}
  #validates :tipo_acao, presence: true, length:  {minimum: 5}
  #validates :juizo, presence: true, length:  {minimum: 5}
  #validates :num_processo, presence: true, length:  {minimum: 5}
  #validates :ultima_movimentacao, presence: true, length:  {minimum: 5}
  #validates :ultimo_contato_cliente, presence: true
  #validates :contato_agendado, presence: true
  #validates :adv_principal, presence: true, length:  {minimum: 4}
  #validates :adv_assistente, presence: true, length:  {minimum: 4}
end
