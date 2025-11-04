*** Settings ***
Resource    ../../resourse/home.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
Teste checkout com sucesso
    
    # Adicionar Produto
    Click Element    xpath=(//*[@content-desc="Product Image"])[1]
    Wait Until Page Contains Element    id=com.saucelabs.mydemoapp.android:id/productTV

    ${preco}    Get Text    id=com.saucelabs.mydemoapp.android:id/priceTV
    Should Be Equal    ${preco}     $ 29.99

    Click Element    xpath=//*[@content-desc="Tap to add product to cart"]
    Click Element    xpath=//*[@content-desc="Displays number of items in your cart"]/android.widget.TextView
    
    # Conferir Carrinho
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/titleTV" and @text="Sauce Labs Backpack"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV" and @text="$ 29.99"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/totalPriceTV" and @text="$ 29.99"]

    # Prosseguir checkout

    # Conferir e concluir a compra