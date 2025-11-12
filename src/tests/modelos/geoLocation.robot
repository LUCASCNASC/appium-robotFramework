*** Settings ***
Resource    ../../resourse/login.resource
Resource    ../../resourse/home.resource
Resource    ../../resourse/geoLocation.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
Teste Geo Location com sucesso

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040

    # Acessar Geo Location
    Acessar página Geo Location