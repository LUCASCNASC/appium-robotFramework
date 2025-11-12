*** Settings ***
Resource    ../../resourse/login.resource
Resource    ../../resourse/home.resource
Resource    ../../resourse/about.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
Teste About com sucesso

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040

    # Acessar About
    Acessar página About