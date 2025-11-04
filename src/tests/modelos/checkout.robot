*** Settings ***
Resource    ../../resourse/login.resource
Resource    ../../resourse/home.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão
Library    String

*** Test Cases ***
Teste checkout com sucesso

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040
    
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

    # Prosseguir checkout - usuário
    Click Element    xpath=//android.widget.Button[@content-desc="Confirms products for checkout"]

    Input Text    id=com.saucelabs.mydemoapp.android:id/fullNameET    text=Lucas
    Input Text    id=com.saucelabs.mydemoapp.android:id/address1ET    text=Rua Teste, 123
    Input Text    id=com.saucelabs.mydemoapp.android:id/cityET    text=Maringá
    Input Text    id=com.saucelabs.mydemoapp.android:id/zipET    text=123456789
    Input Text    id=com.saucelabs.mydemoapp.android:id/countryET    text=Brasil
    Click Element    xpath=//android.widget.Button[@content-desc="Saves user info for checkout"]

    # Prosseguir checkout - pagamento
    Wait Until Page Contains Element    id=com.saucelabs.mydemoapp.android:id/enterPaymentMethodTV

    Input Text    id=com.saucelabs.mydemoapp.android:id/nameET    text=Lucas
    Input Text    id=com.saucelabs.mydemoapp.android:id/cardNumberET    text=1234123412341234
    Input Text    id=com.saucelabs.mydemoapp.android:id/expirationDateET    text=10/32
    Input Text    id=com.saucelabs.mydemoapp.android:id/securityCodeET    text=123
    Click Element    xpath=//android.widget.Button[@content-desc="Saves payment info and launches screen to review checkout data"]


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