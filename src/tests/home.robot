*** Settings ***
Library    AppiumLibrary

*** Test Cases ***
Iniciar Sessão com Sucesso
    [Documentation]    Teste para iniciar sessão com credenciais válidas.
    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    deviceName=Android Emulator
    ...    automationName=UiAutomator2
    ...    app=${EXECDIR}/apps/sauceLab_NEW_2.2.0-25.apk
    ...    udid=emulator-5554
    ...    autoGrantPermissions=true
    
    # Adicione aqui os passos para interagir (digitar login/senha e clicar)
    # Exemplo: Input Text    id=username_field    sua_senha
    
    Sleep    5s
    Close Application