Feature: Processo
  As a usuario do sistema
  I want to adicionar, remover, editar, ver o historico e ver os detalhes dos processos
  So that eu possa ter um controle maios em relacao aos processos

  Scenario: criando um novo processo
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And eu estou na pagina de processos
    When eu eu escolho a opcao de adicionar processo
    And eu preencho o campo de cliente com "nome do cliente"
    And eu preencho o campo de Ex adversa com "nome da parte opositora"
    And eu preencho o campo de Natureza com "Empresarial"
    And eu preencho o campo de Assunto com "Assunto da ação"
    And eu preencho o campo de Tipo acao com "Monitória"
    And eu preencho o campo de Juizo com "2ª vara cívil - GUS"
    And eu preencho o campo de numero com "123456-789.0"
    And eu preencho o campo de Ultimo contato cliente com o dia "1", o mes "August" e o ano "2019"
    And eu preencho o campo de Contato agendado com o dia "31", o mes "December" e o ano "2019"
    And eu clico em confirmar
    Then eu vejo que o processo com o numero "123456" foi criado corretamente

  Scenario: removendo um processo
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu estou na pagina de processos
    And eu vejo o processo com o numero "123"
    When eu clico em remover processo com o numero "123"
    Then eu vejo que o processo com o numero "123" foi removido corretamente

  Scenario: editando um processo
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And eu estou na pagina de processos
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu vejo o processo com o numero "123"
    When eu clico em editar o processo com o numero "123"
    And eu preencho o campo de Contato agendado com o dia "31", o mes "December" e o ano "2020"
    And eu clico em confirmar
    Then eu vejo que o campo Contato agendado do processo tem a data "Contato agendado: 2020-12-31"

  Scenario: exibindo detalhes de um processo
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu estou na pagina de processos
    And eu vejo o processo com o numero "123"
    When eu clico em ver detalhes do processo com o numero "123"
    Then eu vejo a pagina do processo que tem o numero "123"

  Scenario: Scenario: editando um processo sem numero
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And eu estou na pagina de processos
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu vejo o processo com o numero "123"
    When eu clico em editar o processo com o numero "123"
    And eu preencho o campo de numero com ""
    And eu clico em confirmar
    Then eu vejo uma mensagem indicandoque o processo nao pode ser editado sem um numero