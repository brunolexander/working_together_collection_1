# working_together_collection_1

Working_Together_Collection_1 é um sistema de oficina que inclui geração de relatórios em PDF e Excel, gerenciamento de banco de dados, e uma interface web. Este é o primeiro projeto de uma série, focado em práticas de desenvolvimento colaborativo e uso de tecnologias como PHP, HTML, CSS e JavaScript.

# Estrutura final das entidades do projeto.

### Entidade Cliente

Da captura de informações a fazermos, pensamos obter:

codigo_identificador_proprio_dentro_do_sistema
Nome completo/razao social
Endereço (tabela a parte)

    ***Rua**
    * **Número**
    * **Complemento** (opcional)
    * **Bairro**
    * **Cidade**
    * **Estado**
    * **CEP**
Telefone Celular: Até 2 telefones celulares
Email
Cpf/Cnpj
Gênero (masculino/feminino)
Data de cadastro - permite relatorio de acompanhamento da qtde de clientes por periodo.

log de alteracoes do cliente (tabela a parte)

---

### Entidade Veículos

id_identificador
placa
id_cliente (proprietario) fk
modelo
fabricante
ano_fabricacao
local_fabricacao

data_cadastro

data_inativacao

status_veiculo (ativo/inativo) - default ativo

---

### Produtos

id_produto
nome_produto
valor_produto
estoque_produto

categoria (pecas, ferramentas, oleos lubrificantes,...)

---

### Funcionarios

codigo_funcionario
nome_funcionario
dependente_funcionario -> apontado para uma tabela a parte.
ano_nascimento

id_usuario_fk

endereco do funcionario (tabela a parte)

##em_uma_tabela_relaciona por fk##
    -salario do funcionario
    -cargo_funcionario

---

## Servicos

id_servico
descricao_servico
valor_servico/reparo
duracao_tempo_servico (tabela a aprte->id_funcionario e horas_gastas)
categoria_servico

data_inicio

data_termino

##em uma tabela relacionada por fk
    - codigos_pecas_para_reparacao (outra tabela relacionada por fk de uma tabela de pecas)

- quantidade de pecas

---

### Tabelas a parte

**Enderecos**

    - Devem conter dados de enderecos dos funcionario e clientes da empresa, referenciados pelo id respectivo do mesmo.

**Dependentes**

- Devem conter os dados relacionados a todos os dependentes do funcionario(familiares em geral). (somente funcionarios)

**Cargos**

- a tabela de cargos deve referenciar informacoes a tabela de funcionario, tais como, **id, salarios, cargos, descricao de cargos, carga horaria.**

**Duracao Servico**

- Deve possuir informacoes referenciando as tabelas de funcionario e servicos, apontando o tempo de horas gastas para a realizacao de um determinado servico.

estrutura tabela duracao servico

id

id_fk_da tabela servicos

data_inicio

data_termino

**Tabela de Usuarios** (login)

- nesta tabela, id, nome_usuario ,senha (hash sha256)

### Exemplo de estrutura json

Exemplo de Json

```json
{
  "plataforma": {
    "usuarios": [
      {
        "id": 1,
        "nome": "Nome do Funcionário",
        "login": {
          "usuario": "nome_usuario",
          "senha": "senha_segura"
        },
        "permissoes": [
          "gerar_os",
          "vender_peca",
          "executar_manutencao"
        ]
      }
    ],
    "historico_acoes": [
      {
        "id_acao": 101,
        "id_usuario": 1,
        "acao": "geracao_os",
        "detalhes": {
          "id_os": 12345,
          "data_hora": "2024-08-22T09:00:00",
          "descricao": "Geração de Ordem de Serviço para manutenção do veículo"
        }
      },
      {
        "id_acao": 102,
        "id_usuario": 1,
        "acao": "venda_peca",
        "detalhes": {
          "id_venda": 67890,
          "data_hora": "2024-08-22T10:30:00",
          "descricao": "Venda de peça para o veículo XYZ"
        }
      }
    ]
  }
}
```

### Entidade Cliente

Da captura de informações a fazermos, pensamos obter:

Nome

Endereço

* **Rua**
* **Número**
* **Complemento** (opcional)
* **Bairro**
* **Cidade**
* **Estado**
* **CEP**

Placa do veículo

Até 2 telefones celulares

Email

Cpf/cnpj

pessoa_fisica ou pessoa_juridica

Gênero

Data de cadastro - permite relatorio de acompanhamento da qtde de clientes.

### Entidade Veículos
