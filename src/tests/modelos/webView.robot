*** Settings ***
Resource    ../../resourse/login.resource
Resource    ../../resourse/home.resource
Resource    ../../resourse/webView.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
Teste WebView com sucesso

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040

    # Acessar WebView
    Acessar página Web View

    # Acessar outro site
    Acessar outro site    site=meutimao.com.br