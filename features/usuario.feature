Feature: Usuario
  As a usuario do sistema
  I want to cadastrar, logar, alterar senha e fazer o log out
  so that eu possa usar o sistema de gestor de processos

  Scenario: Cadastrando uma conta
    Given Eu estou na tela de log in
    When Eu clico no link Sign up
    And Eu preencho o campo email com "marcos@hotmail.com"
    And Eu preencho o campo senha com "111111"
    And Eu confirmo a senha "111111"
    And Eu clico no botao Sign up
    And Eu preencho o campo nome com "Marcos"
    And Eu preencho o campo N oab com "123123"
    And Eu clico em confirmar
    Then Eu vejo uma mensagem indicando que o cadastro foi realizado com sucesso

  Scenario: Logando no sistema
    Given Eu estou na tela de log in
    And Existe um cadastro com o email "marcos@hotmail.com" e a senha "111111"
    When Eu preencho o campo email com "marcos@hotmail.com"
    And Eu preencho o campo senha com "111111"
    And Eu clico no botao log in
    Then Eu vejo que o login foi bem  sucedido

  Scenario: Log out do sistema
    Given eu estou logado no sistema como o usuario de nome "Marcos" e senha "123123"
    When Eu clico em Sair
    Then Eu retorno para a tela de Log in

  Scenario: Alterando a senha
    Given eu estou logado no sistema como o usuario de nome "Marcos" e senha "111111"
    When Eu clico em exibir detalhes do advogado
    And Eu clico no link Edit
    And Eu clico no link Edit account
    And Eu preencho o campo senha com "123123"
    And Eu confirmo a senha "123123"
    And Eu preencho o campo senha atual com "111111"
    And Eu clico em editar
    Then Eu vejo que a minha conta foi editada com sucesso

Scenario: Cadastrando email existente
    Given Eu estou na tela de log in
    And Existe um cadastro com o email "marcos@hotmail.com" e a senha "111111"
    When Eu clico no link Sign up
    And Eu preencho o campo email com "marcos@hotmail.com"
    And Eu preencho o campo senha com "111111"
    And Eu confirmo a senha "111111"
    And Eu clico no botao Sign up
    Then E vejo uma tela de erro indicando que o email ja esta cadastrado