*** Settings ***
Resource    ../../resourse/login.resource
Resource    ../../resourse/home.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
Teste WebView com sucesso

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040

    # Acessar WebView
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//androidx.recyclerview.widget.RecyclerView[@content-desc="Recycler view for menu"]/android.view.ViewGroup[2]/android.widget.TextView
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/webViewTV