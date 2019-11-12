Feature: Historico
  As a usuario do sistema
  I want to atualizar, remover, editar, ver o historico completo dos processos
  So that eu possa saber de todas as movimentacoes que ocorreram nos processos

  Scenario: adicionando uma movimentacao no historico
    Given eu estou logado no sistema
    And existe um processo com o numero "123"
    And eu estou na pagina do processo com o numero "123"
    When eu clico em ver o historico
    And eu preencho o campo de atualizar historico com "Ultima movimentacao"
    Then eu vejo que o historico do processo com o numero "123" foi atualizado com a descricao "Ultima movimentacao"

  Scenario: adicionando uma movimentacao vazia no historico
    Given eu estou logado no sistema
    And existe um processo com o numero "123"
    And eu estou na pagina do processo com o numero "123"
    When eu clico em ver o historico
    And eu preencho o campo de atualizar historico com ""
    Then eu vejo uma mensagem avisando que o historico nao foi atualizado

  Scenario: ver o historico do processo
    Given eu estou logado no sistema
    And existe um processo com o numero "123"
    And eu estou na pagina do processo com o numero "123"
    When eu clico em historico
    Then eu vejo o historico completo do processo com o numero "123"

  Scenario: remover uma descricao do historico
    Given eu estou logado no sistema
    And existe um processo com o numero "123" com um historico que tem uma descricao "movimentacao do processo"
    And eu estou na pagina do processo com o numero "123"
    When eu clico em historico
    And eu vejo a descricao "movimentacao do processo"
    And eu clico em remover do historico
    Then eu vejo que a descricao "movimentacao do processo" foi removida do processo "123"

  Scenario: editar uma descricao do historico
    Given eu estou logado no sistema
    And existe um processo com o numero "123" com um historico que tem uma descricao "movimentacao do processo"
    And eu estou na pagina do processo com o numero "123"
    When eu clico em historico
    And eu vejo a descricao "movimentacao do processo"
    And eu clico em editar do historico
    And eu preencho o campo de atualizar historico com "Ultima movimentacao"
    Then eu vejo que a descricao do historico do processo com o numero "123" foi atualizada