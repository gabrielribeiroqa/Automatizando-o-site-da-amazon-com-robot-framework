*** Settings ***
Documentation        Essa suite de teste vai realizar testes no site da Amazon
Test Setup           Abrir o navegador
Test Teardown        Fehar o navegador
Resource             ./resources/amazon_teste_resources.robot

*** Test Cases *** 
Caso de Teste 1 - Fazer algumas buscas no site da Amazon
    [Documentation]      Esse teste verifica o menu eletronicos do site da Amazon, 
    ...                  e tem que selecionar a categotia Computadores e Informática,
    ...                  pesquisar por notebooks que seja Windows 11 Pro,  
    ...                  digitando o valor de preço entre 1500 para o Min e 2000 para o Max,
    ...                  após a pesquisa ser feita, voltar para a home,  
    ...                  e fazer uma nova pesquisa, dentro do campo Pesquisa Amazon por alexia 5a geração, 
    ...                  após a pesquisa ser feita voltar novamente para a home e fechar o navegador

    [Tags]               buscas
    
    Dado que estou na page "Eletrônicos" da Amazon
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E a categoria "Computadores e Informática" deve ser exibida na página
    Quando clicar na categoria "Computadores e Informática" E o memu Navegue por Categoria deve ser apresentado e a opção Notebooks tem que ser selecionado
    E após ser selecionado dentro do menu Sistema Operacional o checkbox Windows 11 Pro tem que ser marcado
    E no campo de texto preço deve digitar o valor 1500 para o Min e 2000 para o Max e clicar no botão ir 
    Quando a página Resultados for carregada
    Então tem que clicar no ícone amazon prime .com.br no canto superior esquerdo E ser direcionado para a home da Amazon
    Quanddo estiver na home fazer uma pesquisa pelo o produto "alexia 5a geração"
    Então após a pesquisa ser feita voltar novamente para a tela home da Amazon e fechar o navegador



