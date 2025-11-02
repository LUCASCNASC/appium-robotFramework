*** Settings ***
Resource    ../../resourse/home.resource
Test Setup    Iniciar Sessão    
Test Teardown    Encerrar Sessão

*** Test Cases ***
Teste com Swipe - Forma 1 - Dinamico
    # Navegação
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/itemTV" and @text="Dwawing"]
    Wait Until Element is Visible    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/drawingTV"]

    ${location}    Get Element Location    xpath=//*[@content-desc="Pad to draw on"]
    Log To Console    ${location}

    ${new_x}    Evaluate    ${location}[x]+300
    ${new_y}    Evaluate    ${location}[y]+300

    Swipe   ${location}[x]    ${location}[y]    ${new_x}    ${new_y}

    Sleep    5s

Teste com Swipe - Forma 2 - Fixo
    # Navegação
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/itemTV" and @text="Dwawing"]
    Wait Until Element is Visible    xpath=//*[@resource-id="com.saucelabs.mydemoapp.android:id/drawingTV"]

    ${location}      Create Dictionary    x=100    y=500

    ${new_x}    Evaluate    ${location}[x]+300
    ${new_y}    Evaluate    ${location}[y]+300

    Swipe   ${location}[x]    ${location}[y]    ${new_x}    ${new_y}