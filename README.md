# case-safra
Foi realizada a solução do case em SQL (usando o SGBD MySQL) e também em Python utilizando a biblioteca pandas

A seguir imagens das querys e manipulações feitas.

<hr>

### Case 1 - MySQL
Dadas as tabelas abaixo, escreva uma solução que retorne o nome, a população e a área dospaíses considerados grandes

Um país é considerado grande se satisfaz uma das condições abaixo:
- Sua população é de pelo menos 25 milhões de habitantes
- Tem pelo menos 3 milhões de quilômetros quadrados de área

A execução deve retornar os resultados em qualquer ordem

<p align="center">
  <img src="https://github.com/lucasarauj0h/case-safra/blob/main/imgs/query_paises_grandes.png" alt="Query com os filtros especificados (h" width="70%">
</p>
<h6 align="center">Query com os filtros especificados em SQL</h6>

<p align="center">
  <img src="https://github.com/lucasarauj0h/case-safra/blob/main/imgs/py_paises_grandes.png" alt="Query com os filtros especificados (h" width="70%">
</p>
<h6 align="center">Query com os filtros especificados em Python</h6>


### Case 2 - MySQL

Preço do produto em uma determinada data
Escreva uma query que encontre os preços de todos os produtos no dia 2019-08-16

-  Deve-se assumir que os preços iniciais de todos os produtos antes de qualquer mudança de preços é 10
-  As colunas product_id e change_date formam a chave primária da tabel (colunas com cominação de valores única)
-  Cada linha da tabela representa a mudança de preço de um produto em uma determinada data

<p align="center">
  <img src="https://github.com/lucasarauj0h/case-safra/blob/main/imgs/query_product.png" alt="Query realizando CTE's com os filtros desejados e uma clausula 'join' para inserir os produtos que não estão presentes no filtro (não foram alterados) (h" width="70%">
</p>
<h6 align="center">Query realizando CTE's com os filtros desejados e uma clausula 'join' <br> para inserir os produtos que não estão presentes no filtro (não foram alterados) em SQL</h6>

<p align="center">
  <img src="https://github.com/lucasarauj0h/case-safra/blob/main/imgs/py_product.png" alt="Query realizando CTE's com os filtros desejados e uma clausula 'join' para inserir os produtos que não estão presentes no filtro (não foram alterados) (h" width="70%">
</p>
<h6 align="center">Query realizando CTE's com os filtros desejados e uma clausula 'join' <br> para inserir os produtos que não estão presentes no filtro (não foram alterados) em Python</h6>

