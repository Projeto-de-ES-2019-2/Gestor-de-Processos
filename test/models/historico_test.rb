require 'test_helper'

class HistoricoTest < ActiveSupport::TestCase
  test 'must create historico with description' do
    u = User.new email: "marcos@hotmail.com", password: "123123"
    u.save
    advogado = Advogado.new nome: 'Marcos', n_OAB: '123456'
    advogado.user = u
    advogado.save
    processo = Processo.new cliente: 'nome do cliente', num_processo: '123123123'
    processo.advogado = advogado
    processo.save
    historico = Historico.new descricao: 'Descricao da movimentacao', processo_id: processo.id
    assert historico.save
  end

  test 'should not create historico without description' do
    historico = Historico.new processo_id: '1'
    assert_not historico.save
  end

  test 'should not create historico with description less than 5' do
    historico = Historico.new descricao: 'Des', processo_id: '1'
    assert_not historico.save
  end

  test 'should not create historico without processo' do
    historico = Historico.new descricao: 'Descricao completa'
    assert_not historico.save
  end
end
