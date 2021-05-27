# blockchain_election

## Requisitos

- Iniciar uma votação com data limite e as listas dos candidatos
- Cada pessoa vota apenas uma vez
- [A pessoa deverá ter confirmaçao de que o voto foi para o candidato certo | Como?]
- Ao fim da data limite, a eleição poderá ser encerrada 
    -  Algum tipo de confirmação/divulgação dos resultados deverá ser emitida

**Todos:**
 - [ ] Geração das carteiras "válidas/registradas" que receberão os tokens
 - [ ] O contrado da eleição em si
 - [ ] Integração do externa com algum serviço -> Eventos
 - [ ] Fazer a apresentação


## Porque

 - Número de votos de cada candidato só pode ser acesssado ao final da eleição para evitar o efeito manada

 ## Features
 - [ ] Ao criar o contrato é passada um objeto com o nome e número de cada candidato e um timestamp de encerramento;
 - [ ] Existirá um função "votar" que redeceberá o número do candidato, computará o voto e retornará o nome do candidato votado;
 - [ ] Existirá um objeto público com o nome e número de cada candidato para que os eleitores possam conferir os números dos candidatos;
 - [ ] A eleição receberá um timestamp de encerramento, os votos só serão computados antes desse tempo;
 - [ ] Existirá uma função de encerramento das eleições que só poderá ser chamada após o timestamp de encerramento. Qualquer um poderá encerrar a eleição. Ela chamará a função de disparo de eventos;
 - [ ] Os eleitores deverão poder ver o resultado da eleição após seu encerramento. (Completo, não apenas o vencedor);
 - Modelo de objeto a ser seguido:


```json
 {
     num : "nome",
     13 : "Luloso",
     17: "Bubassauro",
     45: "Doriana"

 },

 {
     13: 100,
     17: 100,
     45: 45,
 }
```
