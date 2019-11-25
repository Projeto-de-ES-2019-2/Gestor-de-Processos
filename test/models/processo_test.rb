require 'test_helper'

class ProcessoTest < ActiveSupport::TestCase
  test 'must create processo with num_processo, cliente and advogado' do
    u = User.new email: "yuri@gmail.com", password: "123123"
    u.save
    advogado = Advogado.new nome: 'yuri', n_OAB: '123456'
    advogado.user = u
    advogado.save
    processo = Processo.new num_processo: '12345', cliente: 'cliente'
    processo.advogado = advogado
    assert processo.save
  end

  test 'should not create processo without numm_processo' do
    u = User.new email: "yuri@gmail.com", password: "123123"
    u.save
    advogado = Advogado.new nome: 'yuri', n_OAB: '123456'
    advogado.user = u
    advogado.save
    processo = Processo.new cliente: 'cliente'
    processo.advogado = advogado
    assert_not processo.save
  end

  test 'should not create processo without cliente' do
    u = User.new email: "yuri@gmail.com", password: "123123"
    u.save
    advogado = Advogado.new nome: 'yuri', n_OAB: '123456'
    advogado.user = u
    advogado.save
    processo = Processo.new num_processo: '12345'
    processo.advogado = advogado
    assert_not processo.save
  end

  test 'should not create processo without advogado' do
    processo = Processo.new num_processo: '12345', cliente: 'cliente'
    assert_not processo.save
  end
end