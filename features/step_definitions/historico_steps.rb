And ('eu estou na pagina do processo com o numero {string}') do |num|
  visit '/processos'
  expect(page).to have_content('Processos')
  click_link "s-#{num}"
  expect(page).to have_content('Processo - '+num)
end

When ('eu clico em ver o historico') do
  click_link "historico"
  expect(page).to have_content('Histórico')
end

And ('eu preencho o campo de atualizar historico com {string}') do |descricao|
  fill_in 'historico_descricao', :with => descricao
end

Then ('eu vejo que o historico do processo com o numero {string} foi atualizado com a descricao {string}') do |num, descricao|
  expect(page).to have_content('Historico was successfully created')
end

Then ('eu vejo uma mensagem avisando que o historico nao foi atualizado') do

end

Then ('eu vejo o historico completo do processo com o numero {string}') do |num|

end

And ('o processo com o numero {string} tem um historico com uma descricao {string}') do |num, descricao|

end

And ('eu vejo a descricao {string}') do |descricao|

end

And ('eu clico em remover do historico com descricao {string}') do |descricao|

end

Then ('eu vejo que a descricao {string} foi removida do processo que tem o numero {string}') do |descricao, num|

end

And ('eu clico em editar o historico da movimentacao {string}') do |descricao|

end

Then ('eu vejo que a descricao do historico do processo com o numero {string} foi atualizada para {string}') do |num, descricao|

end
