*** Settings ***
Resource    ../../resourse/login.resource
Resource    ../../resourse/home.resource
Resource    ../../resourse/checkout.resource
Test Setup    Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
Teste checkout com sucesso

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040
    
    # Adicionar Produto
    Adicionar Produto    posicao_produto=1    nome_produto=    preco_produto= $ 29.99
    
    # Conferir Carrinho
    Validar Carrinho    nome_produto=Sauce Labs Backparck    preco_produto= $ 29.99
    
    # Prosseguir checkout - usuário
    Checkout - preencher dados do usuário    nome=Lucas    endereco=Rua Teste, 123    cidade=Maringá    zip=123456789    pais=Brasil

    # Prosseguir checkout - pagamento
    Checkout - preencher dados de pagamento    nome=Lucas    cartao=1234123412341234    exp=10/32    sec_code=123

    # Conferir e concluir a compra
    Validar e concluir compra    preco_produto= $ 29.99

Teste checkout com sucesso com mais de um Endereço

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040
    
    # Adicionar Produto
    Adicionar Produto    posicao_produto=1    nome_produto=    preco_produto= $ 29.99
    
    # Conferir Carrinho
    Validar Carrinho    nome_produto=Sauce Labs Backparck    preco_produto= $ 29.99
    
    # Prosseguir checkout - usuário
    Checkout - preencher dados do usuário    nome=Lucas    endereco=Rua Teste, 123    cidade=Maringá    zip=123456789    pais=Brasil

    # Prosseguir checkout - pagamento
    Checkout - preencher dados de pagamento    nome=Lucas    cartao=1234123412341234    exp=10/32    sec_code=123

    # Adicionar endereço de pagamento
    Checkout - preencher dados Endereço de pagamento    nome=Lucas    endereco=Av. Brasil, 456    cidade=São Paulo    zip=987654321    pais=Brasil

    # Conferir e concluir a compra
    Validar e concluir compra    preco_produto= $ 29.99

Teste adicionar e remover produto do carrinho sem checkout

    # Fazer Login
    Acessar página de Login
    Fazer Login    email=bod@example.com    password=10203040
    
    # Adicionar Produto
    Adicionar Produto    posicao_produto=1    nome_produto=    preco_produto= $ 29.99
    
    # Conferir Carrinho
    
    