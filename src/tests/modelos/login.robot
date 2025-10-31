*** Settings ***
Resource    ../../resourse/home.resource

*** Test Cases ***
Login com sucesso
    Iniciar Sessão

    # Acessar menu
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@content-desc="Login Menu Item"]
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/loginTV

    # Inserir os dados
    Input Text    id=com.saucelabs.mydemoapp.android:id/nameET    text=bod@example.com
    Input Text    id=com.saucelabs.mydemoapp.android:id/passwordET    text=10203040
    Click Element    id=com.saucelabs.mydemoapp.android:id/loginBtn

    # Validação
    Wait Until Page Does Not Contain Element    id=com.saucelabs.mydemoapp.android:id/loginTV
    Click Element    xpath=//*[@content-desc="View menu"]
    Wait until Element Is Visible    xpath=//*[@content-desc="Logout Menu Item"]

    Encerrar Sessão    