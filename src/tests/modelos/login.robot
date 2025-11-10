*** Settings ***
Resource    ../../resourse/home.resource
Resource    ../../resourse/login.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
Login com sucesso

    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040

    # Validação
    Wait Until Page Does Not Contain Element    id=com.saucelabs.mydemoapp.android:id/loginTV
    Click Element    xpath=//*[@content-desc="View menu"]
    Wait until Element Is Visible    xpath=//*[@content-desc="Logout Menu Item"]

Login sem sucesso

    Acessar página de Login
    Fazer Login    email=alice@example.com    password=test

    # Validação
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/passwordErrorTV
    Wait Until Page Contains    text=Sorry this user has been locked out.

Login Logout
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@content-desc="Logout Menu Item"]
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.appcompat.widget.LinearLayoutCompat/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[2]
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/loginTV

Login sem sucesso faltando senha
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=
    Wait Until Page Contains    text=Enter Password

Login sem sucesso faltando email
    Acessar página de Login
    Fazer Login    email=    password=10203040
    Wait Until Page Contains    text=Username is required