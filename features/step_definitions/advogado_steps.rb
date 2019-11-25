And ('Eu estou na pagina inicial') do
  visit '/advogados'
  expect(page).to have_content('Pagina Inicial')
end

And ('Eu clico no link Edit') do
  click_link "Edit"
end

And ('Eu preencho o campo N oab com {string}') do |n_OAB|
  fill_in 'N oab', :with => n_OAB
end

And ('Eu preencho o campo nome com {string}') do |nome|
  fill_in 'Nome', :with => nome
end

And ('Eu clico em confirmar') do
  click_button 'submit'
end

When ('Eu clico em exibir detalhes do advogado') do
  click_link "Show"
end

When ('Eu clico em exibir advogados') do
  click_link "Advogados"
end

Then ('Eu vejo os detalhes do cadastro do advogado de nome {string}') do |nome|
  expect(page).to have_content("Advogado Info - #{nome}")
end

Then ('Eu vejo que o Advogado nao pode ser editado') do
  assert_selector('div#error_explanation')
end

Then ('Eu vejo que o advodago {string} foi criado com sucesso') do |nome|
  expect(page).to have_content(nome)
end

Then ('Eu vejo que o Advogado foi editado com sucesso') do
  expect(page).to have_content('Advogado was successfully updated.')
end

Then ('Eu vejo a lista de advogados cadastrados') do
  expect(page).to have_content('Lista de Advogados')
end
