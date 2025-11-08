*** Settings ***
Resource    ../../resourse/login.resource
Resource    ../../resourse/home.resource
Resource    ../../resourse/checkout.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão
Library    String

*** Test Cases ***
Teste checkout com sucesso

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040
    
    # Adicionar Produto
    Adicionar Produto    posicao_produto=1    nome_produto=    preco_produto= $ 29.99
    
    # Conferir Carrinho
    Validar Carrinho    nome_produto=Sauce Labs Backparck    preco_produto= $ 29.99
    
    # Prosseguir checkout - usuário
    Checkout - preencher dados do usuário    nome=Lucas    endereco=Rua Teste, 123    cidade=Maringá    zip=123456789    pais=Brasil

    # Prosseguir checkout - pagamento
    Checkout - preencher dados de pagamento    nome=Lucas    cartao=1234123412341234    exp=10/32    sec_code=123
    
    # Conferir e concluir a compra
    Wait Until Page Contains    text=Review your order

    ${location}    Get Element Location    text=Deliver Address

    ${new_y}    ${location}[y]-500

    Swipe    ${location}[x]    ${location}[y]    ${location}[x]    ${new_y}

    ${frete}    Get Text    xpath=//android.widget.ScrollView[@content-desc="Manages scrolling of views in given screen"]/android.view.ViewGroup/android.widget.TextView[2]
    ${frete}    Replace String    ${frete}    $    ${EMPTY}
    ${frete}    Convert To Number    ${frete}

    ${soma}    Evaluate    ${frete}+29.99
    ${soma}    Set Variable    $ ${frete}+29.99

    ${valor_total}    Get Text    id=com.saucelabs.mydemoapp.android:id/totalAmountTV

    Should Be Equal    ${soma}    ${valor_total}

    Click Element    xpath=//android.widget.Button[@content-desc="Completes the process of checkout"]
    Wait Until Page Contains    text=Checkout Complete
    Wait Until Page Contains    text=Continue Shopping
    Click Element    xpath=//android.widget.Button[@content-desc="Tap to open catalog"]