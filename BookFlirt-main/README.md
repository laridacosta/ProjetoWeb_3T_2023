# Definição

Em grupos formados por até 4 pessoas, vocês devem desenvolver um sistema que, de alguma forma, será um clone do Tinder. Porém, o que será avaliado pelas pessoas que o utilizarão será de escolha dos grupos. Algumas sugestões são jogos, séries, filmes, artistas, etc. De forma objetiva, o sistema deve apresentar para pessoas logadas itens que devem ser classificados e a classificação deve gerar um ranking.

## Front

<https://materializecss.com>

## Requisitos Funcionais

O sistema deve possuir dois papéis para as pessoas que vão o utilizar com permissões distintas: pessoa usuária e gerente. Abaixo vocês podem conferir quais são as atividades que podem/devem ser realizadas por cada papel.

### Pessoa usuária

- [ ] Criar e editar informações de pessoa usuária (e-mail, senha, nome)
- [ ] Fazer login e logout no sistema
- [ ] Classificar itens (Indicar se gosta de uma série, se comeria uma comida, etc).
- [ ] Visualizar rankings dos itens classificados como mais queridos
- [ ] Visualizar rankings dos itens classificados como menos queridos
- [ ] Ordenar de forma crescente ou decrescente os rankings de classificações

### Gerente

- [X] A pessoa que será gerente deve ser cadastrada no banco previamente (user: admin e password: senha123)
- [X] Fazer login e logout no sistema
- [X] Visualizar ranking dos itens classificados
- [ ] Ordenar de forma crescente ou decrescente o ranking de classificações
- [X] Listar, adicionar, editar e excluir itens

### Regras de negócio

Abaixo são especificadas regras que incidem sobre o usuo do sistema:

- [ ] A pessoa usuária não pode alterar seu e-mail
- [ ] O e-mail da pessoa usuária deve ser do domínio @aluno.feliz.ifrs.edu.br
- [ ] Um item consiste em uma imagem de algo
- [ ] O ranking deve ser ordenado pelo número de avaliações positivas ou negativas
- [ ] O sistema deve iniciar com pelo menos 15 itens cadastrados
