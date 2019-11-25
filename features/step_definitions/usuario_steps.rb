Given ('eu estou logado no sistema como o usuario de nome {string} e senha {string}') do |nome, senha|
  u = User.new(:email => 'usuario@email.com', :password => senha, :password_confirmation => senha)
  u.save!
  a = Advogado.new(nome: nome, n_OAB: "123123")
  a.user = u
  a.save
  visit '/users/sign_in'
  expect(page).to have_content('Log in')
  fill_in 'Email' , :with => 'usuario@email.com'
  fill_in 'Password', :with => senha
  click_button 'Log in'
  expect(page).to have_content('Signed in successfully.')
end

And ('Existe um cadastro com o email {string} e a senha {string}')  do |email, senha|
  u = User.new(:email => email, :password => senha, :password_confirmation => senha)
  a = Advogado.new(:nome => "nome", :n_OAB => "123123")
  a.user = u
  u.save!
end

Then ('Eu vejo que o login foi bem  sucedido') do
  expect(page).to have_content('Signed in successfully')
end

Given ('Eu estou na tela de log in') do
  visit 'users/sign_in'
  expect(page).to have_content('Log in')
end

When ('Eu clico no link Sign up') do
  click_link 'Sign up'
  expect(page).to have_content('Sign up')
end

And ('Eu preencho o campo email com {string}') do |email|
  fill_in 'Email', :with => email
end

And ('Eu preencho o campo senha com {string}') do |senha|
  fill_in 'user_password', :with => senha
end

And ('Eu confirmo a senha {string}') do |senha|
  fill_in 'user_password_confirmation', :with => senha
end

And ('Eu clico no botao Sign up') do
  click_button 'Sign up'
end

Then ('Eu vejo uma mensagem indicando que o cadastro foi realizado com sucesso') do
  expect(page).to have_content('Advogado was successfully created.')
end

And ('Eu clico no botao log in') do
  click_button 'Log in'
end

When ('Eu clico em Sair') do
  click_link 'Sair'
end

Then ('Eu retorno para a tela de Log in') do
  expect(page).to have_content('Log in')
end

And ('Eu clico no link Edit account') do
  click_link 'Edit account'
end

And ('Eu preencho o campo senha atual com {string}') do |senha|
  fill_in 'user_current_password', :with => senha
end

And ('Eu clico em editar') do
  click_button 'Update'
end

Then ('Eu vejo que a minha conta foi editada com sucesso') do
  expect(page).to have_content('Your account has been updated successfully.')
end

Then ('E vejo uma tela de erro indicando que o email ja esta cadastrado') do
  assert_selector('div#error_explanation')
end