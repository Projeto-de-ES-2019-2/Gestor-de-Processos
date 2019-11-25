When ('eu preencho o campo de pesquisa com o numero {string}') do |num|
  fill_in 'search', :with => num
end

And ('eu clico em buscar') do
  click_button 'Buscar'
end

And ('nao existe um processo com o numero {string} que tem {string} como advogado') do |num, nome|
  a = Advogado.find_by nome: nome
  p = a.processos.all.where('num_processo like ?', num)

  p.each do |processo|
    processo.destroy
  end
end

Then ('eu vejo uma mensagem indicando que o campo de pesquisa deve ser preenchido') do
  expect(page).to have_content('Fill in the search field.')
end

Then ('eu vejo uma mensagem indicando que a pesquisa nao retornou nenhum resultado') do
  expect(page).to have_content('Search returned no results.')
end