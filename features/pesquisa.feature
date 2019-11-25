Feature: Pesquisa
  As a usuario do sistema
  I want to pesquisar processos pelo numero
  so that facilite a consulta de processos

  Scenario: pesquisando um processo pelo seu numero
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu estou na pagina de processos
    When eu preencho o campo de pesquisa com o numero "123"
    And eu clico em buscar
    Then eu vejo o processo com o numero "123"

  Scenario: pesquisando um processo por parte do seu numero
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123456789" que tem "Yuri" como advogado
    And eu estou na pagina de processos
    When eu preencho o campo de pesquisa com o numero "123"
    And eu clico em buscar
    Then eu vejo o processo com o numero "123456789"

  Scenario: pesquisando um processo sem preencher o campo de pesquisa
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu estou na pagina de processos
    When eu preencho o campo de pesquisa com o numero ""
    And eu clico em buscar
    Then eu vejo uma mensagem indicando que o campo de pesquisa deve ser preenchido

  Scenario: pesquisando um processo que nao esta cadastrado
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And nao existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu estou na pagina de processos
    When eu preencho o campo de pesquisa com o numero "123"
    And eu clico em buscar
    Then eu vejo uma mensagem indicando que a pesquisa nao retornou nenhum resultado

  Scenario: pesquisando um processo que esta cadastrado para outro advogado
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123" que tem "Marcos" como advogado
    And eu estou na pagina de processos
    When eu preencho o campo de pesquisa com o numero "123"
    And eu clico em buscar
    Then eu vejo uma mensagem indicando que a pesquisa nao retornou nenhum resultado