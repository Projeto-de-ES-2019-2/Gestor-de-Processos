Feature: Historico
  As a usuario do sistema
  I want to atualizar, remover, editar, ver o historico completo dos processos
  So that eu possa saber de todas as movimentacoes que ocorreram nos processos

  Scenario: adicionando uma movimentacao no historico
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu estou na pagina do processo com o numero "123"
    When eu clico em ver o historico
    And eu preencho o campo de atualizar historico com "Ultima movimentacao"
    And eu clico em confirmar
    Then eu vejo que o historico do processo com o numero "123" foi atualizado com a descricao "Ultima movimentacao"

  Scenario: adicionando uma movimentacao vazia no historico
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu estou na pagina do processo com o numero "123"
    When eu clico em ver o historico
    And eu preencho o campo de atualizar historico com ""
    And eu clico em confirmar
    Then eu vejo uma mensagem avisando que o historico nao foi atualizado

  Scenario: ver o historico do processo
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu estou na pagina do processo com o numero "123"
    When eu clico em ver o historico
    Then eu vejo o historico completo do processo com o numero "123"

  Scenario: remover uma descricao do historico
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And eu estou na pagina do processo com o numero "123"
    And o processo com o numero "123" tem um historico com uma descricao "movimentacao do processo"
    When eu clico em ver o historico
    And eu vejo a descricao "movimentacao do processo"
    And eu clico em remover do historico com descricao "movimentacao do processo"
    Then eu vejo que a descricao "movimentacao do processo" foi removida do processo que tem o numero "123"

  Scenario: editar uma descricao do historico
    Given eu estou logado no sistema como o usuario de nome "Yuri" e senha "111111"
    And existe um processo com o numero "123" que tem "Yuri" como advogado
    And o processo com o numero "123" tem um historico com uma descricao "movimentacao do processo"
    And eu estou na pagina do processo com o numero "123"
    When eu clico em ver o historico
    And eu vejo a descricao "movimentacao do processo"
    And eu clico em editar o historico da movimentacao "movimentacao do processo"
    And eu preencho o campo de atualizar historico com "Ultima movimentacao"
    And eu clico em confirmar
    Then eu vejo que a descricao do historico foi atualizada com sucesso