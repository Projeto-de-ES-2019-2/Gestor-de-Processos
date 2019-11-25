And ('eu estou na pagina de processos') do
  visit '/processos'
  expect(page).to have_content('Processos')
end

When ('eu eu escolho a opcao de adicionar processo') do
  click_link 'New Processo'
  expect(page).to have_content('New Processo')
end

And ('eu preencho o campo de cliente com {string}') do |nome|
  fill_in 'processo_cliente', :with => nome
end

And ('eu preencho o campo de Ex adversa com {string}') do |texto|
  fill_in 'processo_ex_adversa', :with => texto
end

And ('eu preencho o campo de Natureza com {string}') do |texto|
  fill_in 'processo_natureza', :with => texto
end

And ('eu preencho o campo de Assunto com {string}') do |texto|
  fill_in 'processo_assunto', :with => texto
end

And ('eu preencho o campo de Tipo acao com {string}') do |texto|
  fill_in 'processo_tipo_acao', :with => texto
end

And ('eu preencho o campo de Juizo com {string}') do |texto|
  fill_in 'processo_juizo', :with => texto
end

And ('eu preencho o campo de numero com {string}') do |num|
  fill_in 'processo_num_processo', :with => num
end

And ('eu preencho o campo de Ultimo contato cliente com o dia {string}, o mes {string} e o ano {string}') do |dia, mes, ano|
  select ano, :from => 'processo_ultimo_contato_cliente_1i'
  select mes, :from => 'processo_ultimo_contato_cliente_2i'
  select dia, :from => 'processo_ultimo_contato_cliente_3i'
end

And ('eu preencho o campo de Contato agendado com o dia {string}, o mes {string} e o ano {string}') do |dia, mes, ano|
  select ano, :from => 'processo_contato_agendado_1i'
  select mes, :from => 'processo_contato_agendado_2i'
  select dia, :from => 'processo_contato_agendado_3i'
end

And ('eu clico em confirmar') do
  click_button 'submit'
end

Then ('eu vejo que o processo com o numero {string} foi criado corretamente') do |num|
  expect(page).to have_content(num)
end

And ('existe um processo com o numero {string} que tem {string} como advogado') do |num, nome|
  p = Processo.new(:cliente => 'cliente', :ex_adversa =>'opositor', :tipo_acao => 'tipo de ação',
                   :juizo => 'juizo', :num_processo => num, :ultimo_contato_cliente => Date.current,
                   :contato_agendado => Date.current.tomorrow)
  p.advogado = Advogado.find_by nome: nome

  if p.advogado.nil?
    p.advogado = Advogado.new(nome: nome, n_OAB: "123123")
  end

  p.save!
end

And ('eu vejo o processo com o numero {string}') do |num|
  visit '/processos'
  expect(page).to have_content(num)
end

When ('eu clico em remover processo com o numero {string}') do |num|
  click_link "d-#{num}"
end

Then ('eu vejo que o processo com o numero {string} foi removido corretamente') do |num|
  expect(page).to have_no_content(num)
end

When ('eu clico em editar o processo com o numero {string}') do |num|
  click_link "e-#{num}"
end

Then ('eu vejo que o campo Contato agendado do processo tem a data {string}') do |data|
  expect(page).to have_content(data)
end

When ('eu clico em ver detalhes do processo com o numero {string}') do |num|
  click_link "s-#{num}"
end

Then ('eu vejo a pagina do processo que tem o numero {string}') do |num|
  expect(page).to have_content("Processo - #{num}")
end

Then ('eu vejo uma mensagem indicandoque o processo nao pode ser editado sem um numero') do
  assert_selector('div#error_explanation')
end