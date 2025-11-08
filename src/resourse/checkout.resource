*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Adicionar Produto
    [Arguments]    ${posicao_produto}    ${nome_produto}    ${preco_produto}
    Click Element    xpath=(//*[@content-desc="Product Image"])[${posicao_produto}]
    Wait Until Page Contains Element    id=com.saucelabs.mydemoapp.android:id/productTV

    ${preco}    Get Text    id=com.saucelabs.mydemoapp.android:id/priceTV
    Should Be Equal    ${preco}     ${preco_produto}

    Click Element    xpath=//*[@content-desc="Tap to add product to cart"]
    Click Element    xpath=//*[@content-desc="Displays number of items in your cart"]/android.widget.TextView

Validar Carrinho    
    [Arguments]    ${nome_produto}    ${preco_produto}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/titleTV" and @text="${nome_produto}"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/priceTV" and @text=${preco_produto}"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/totalPriceTV" and @text="${preco_produto}"]

Checkout - preencher dados do usuário
    [Arguments]    ${nome}   ${endereco}    ${cidade}   ${zip}    ${pais}

    Click Element    xpath=//android.widget.Button[@content-desc="Confirms products for checkout"]

    Input Text    id=com.saucelabs.mydemoapp.android:id/fullNameET    text=${nome}  
    Input Text    id=com.saucelabs.mydemoapp.android:id/address1ET    text=${endereco}
    Input Text    id=com.saucelabs.mydemoapp.android:id/cityET    text=${cidade} 
    Input Text    id=com.saucelabs.mydemoapp.android:id/zipET    text=${zip}
    Input Text    id=com.saucelabs.mydemoapp.android:id/countryET    text=${pais}
    Click Element    xpath=//android.widget.Button[@content-desc="Saves user info for checkout"]
    
Checkout - preencher dados de pagamento    
    [Arguments]    ${nome}=Lucas    ${cartao}=1234123412341234    ${exp}=10/32    ${sec_code}=123
    Wait Until Page Contains Element    id=com.saucelabs.mydemoapp.android:id/enterPaymentMethodTV
    Input Text    id=com.saucelabs.mydemoapp.android:id/nameET    text=${nome}
    Input Text    id=com.saucelabs.mydemoapp.android:id/cardNumberET    text=${cartao}
    Input Text    id=com.saucelabs.mydemoapp.android:id/expirationDateET    text=${exp}
    Input Text    id=com.saucelabs.mydemoapp.android:id/securityCodeET    text=${sec_code}
    Click Element    xpath=//android.widget.Button[@content-desc="Saves payment info and launches screen to review checkout data"]
