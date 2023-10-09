*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${BROWSER}                                                  chrome
${URL}                                                      https://www.amazon.com.br/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics
${TEXTO_ELETONICO_E_TECNOLOGIA}                             Eletrônicos e Tecnologia
${LOC_TEXTO_ELETONICO_E_TECNOLOGIA}                         //h1[contains(.,'Eletrônicos e Tecnologia')]
${TITULO_DA_PAGINA_ELETONICO_E_TECNOLOGIA}                  Eletrônicos e Tecnologia | Amazon.com.br
${CATEGORIA_COMPUTADOR_INFORMATICA}                         //img[contains(@alt,'Computadores e Informática')]
${TEXTO_DE_CONFIRMAÇÃO_DA_TELA_COMPUTADOR_E_INFORMATICA}    //h1[contains(.,'Computadores e Informática')]
${CLICAR_NA_CATEGORIA_NOTEBOOKS}                            //img[@src='https://m.media-amazon.com/images/G/32/BR-hq/2021/img/Consumer_Electronics/Storefronts/PC/XCM_CUTTLE_1374608_1958960_BR_500x500_2X_en_US._SS400_QL85_.jpg']
${SEECIONAR_BTN_VALOR_MINIMO}                               low-price
${SEECIONAR_BTN_VALOR_MAXIMO}                               high-price
${VALOR_MINIMO}                                             1500
${VALOR_MAXIMO}                                             2000
${BTN_IR}                                                   //input[contains(@class,'a-button-input')]
${VERIFICAR_A_PAGINA_RESULTADOS}                            //span[@class='a-size-medium-plus a-color-base a-text-bold'][contains(.,'Resultados')]
${BTN_AMAZON_PRIME.COM.BR}                                  //a[contains(@class,'nav-logo-link nav-progressive-attribute')]
${CAMPO_DE_PESQUISA_DA_HOME_DA_AMAZON}                      twotabsearchtextbox
${TEXTO_ALEXIA_5a_GERAÇÃO}                                  alexia 5a geração
${BTN_PESQUISA_HOME_DA_AMAZON}                              nav-search-submit-button
${SELECIONANDO_A_ALEXIA}                                    //img[contains(@alt,'Novo Echo Dot 5ª geração com Relógio | Smart speaker com Alexa | Cor Branca')]


*** Keywords ***
Abrir o navegador
    Open Browser   browser=${BROWSER} 
    # Open Browser   browser=chrome  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fehar o navegador
    Sleep    2
    Close Browser

Dado que estou na page "Eletrônicos" da Amazon
    Go To    url=${URL}

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página 
    Wait Until Page Contains         text=${TEXTO_ELETONICO_E_TECNOLOGIA}
    Page Should Contain              text=${TEXTO_ELETONICO_E_TECNOLOGIA}
   
E o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Title Should Be    title=${TITULO_DA_PAGINA_ELETONICO_E_TECNOLOGIA}
    
E a categoria "Computadores e Informática" deve ser exibida na página 
    Wait Until Element Is Visible    locator=${CATEGORIA_COMPUTADOR_INFORMATICA} 
    Page Should Contain Element      locator=${CATEGORIA_COMPUTADOR_INFORMATICA}        
   
Quando clicar na categoria "Computadores e Informática" E o memu Navegue por Categoria deve ser apresentado e a opção Notebooks tem que ser selecionado
    Click Element                     locator=${CATEGORIA_COMPUTADOR_INFORMATICA}
    Wait Until Element Is Visible     locator=${CLICAR_NA_CATEGORIA_NOTEBOOKS}
    Click Element                     locator=${CLICAR_NA_CATEGORIA_NOTEBOOKS} 
   
E após ser selecionado dentro do menu Sistema Operacional o checkbox Windows 11 Pro tem que ser marcado
    Element Should Be Enabled    xpath=//*[@id="s-refinements"]/div[2]/ul/li[2]/span/a/div/label/i
    Element Should Be Visible    xpath=//*[@id="s-refinements"]/div[2]/ul/li[2]/span/a/div/label/i
    Click Element                xpath=//*[@id="s-refinements"]/div[2]/ul/li[2]/span/a/div/label/i

E no campo de texto preço deve digitar o valor 1500 para o Min e 2000 para o Max e clicar no botão ir
    Wait Until Element Is Visible    locator=${SEECIONAR_BTN_VALOR_MINIMO}
    Wait Until Element Is Visible    locator=${SEECIONAR_BTN_VALOR_MAXIMO}
    Page Should Contain Button    locator=${SEECIONAR_BTN_VALOR_MINIMO}
    Page Should Contain Button    locator=${SEECIONAR_BTN_VALOR_MAXIMO}
    Input Text      locator=${SEECIONAR_BTN_VALOR_MINIMO}    text=${VALOR_MINIMO}
    Input Text      locator=${SEECIONAR_BTN_VALOR_MAXIMO}    text=${VALOR_MAXIMO}
    Click Button    locator=${BTN_IR}

Quando a página Resultados for carregada
    Page Should Contain Element    locator=${VERIFICAR_A_PAGINA_RESULTADOS}

Então tem que clicar no ícone amazon prime .com.br no canto superior esquerdo e ser direcionado para a home da Amazon
    Page Should Contain Element    locator=${BTN_AMAZON_PRIME.COM.BR}
    Click Element                  locator=${BTN_AMAZON_PRIME.COM.BR}

Quanddo estiver na home fazer uma pesquisa pelo o produto "alexia 5a geração"
    Wait Until Element Is Visible    locator=${CAMPO_DE_PESQUISA_DA_HOME_DA_AMAZON}
    Page Should Contain Element      locator=${CAMPO_DE_PESQUISA_DA_HOME_DA_AMAZON}
    Page Should Contain Element      locator=${BTN_PESQUISA_HOME_DA_AMAZON}
    Input Text                       locator=${CAMPO_DE_PESQUISA_DA_HOME_DA_AMAZON}      text=${TEXTO_ALEXIA_5a_GERAÇÃO} 
    Click Element                    locator=${BTN_PESQUISA_HOME_DA_AMAZON} 

Então após a pesquisa ser feita voltar novamente para a tela home da Amazon e fechar o navegador
    Click Element                  locator=${BTN_AMAZON_PRIME.COM.BR}