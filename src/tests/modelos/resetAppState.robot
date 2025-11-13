*** Settings ***
Resource    ../../resourse/login.resource
Resource    ../../resourse/home.resource
Resource    ../../resourse/resetAppState.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
Acessar página Reset App State e cancelar

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040

    # Acessar Reset App State
    Acessar página Reset App State e cancelar

    # Clicar no botão CANCEL para cancelar o reset do app
    Clicar no botão cancel

    # Validar que ao clicar em CANCEL, realmente foi cancelado
    Validar que o reset foi cancelado

Acessar página Reset App State e resetar

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040

    # Acessar Reset App State
    Acessar página Reset App State e cancelar

    # Clicar no botão RESET APP para resetar o app
    Clicar no botão Reset App

    # Validar que ao clicar em RESET APP, realmente foi resetado
    Validar que o app foi resetado