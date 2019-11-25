require 'test_helper'

class AdvogadoTest < ActiveSupport::TestCase
  test 'should create advogado with nome, n_OAB and user' do
    u = User.new email: "marcos@hotmail.com", password: "123123"
    u.save
    advogado = Advogado.new nome: 'Marcos', n_OAB: '123456'
    advogado.user = u
    assert advogado.save
  end

  test 'should update advogado with nome and n_OAB' do
    u = User.new email: "marcos@hotmail.com", password: "123123"
    u.save
    advogado = Advogado.new nome: 'Marcos', n_OAB: '122345'
    advogado.user = u
    advogado.save
    advogado.nome = 'Marcos Vinicius'
    advogado.n_OAB = '123456'
    assert advogado.save
  end

  test 'should not create advogado without nome and n_OAB' do
    u = User.new email: "marcos@hotmail.com", password: "123123"
    u.save
    advogado = Advogado.new
    advogado.user = u
    assert_not advogado.save
  end

  test 'should not create advogado without user' do
    advogado = Advogado.new nome: 'Marcos', n_OAB: '123456'
    assert_not advogado.save
  end
end