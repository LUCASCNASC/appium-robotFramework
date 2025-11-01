*** Settings ***
Library   AppiumLibrary

*** Keywords ***
Acessar página de Login
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//*[@content-desc="Login Menu Item"]
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/loginTV

Fazer Login
    [Arguments]    ${email}    ${password}
    Input Text    id=com.saucelabs.mydemoapp.android:id/nameET    text=${email}
    Input Text    id=com.saucelabs.mydemoapp.android:id/passwordET    text=${password}
    Click Element    id=com.saucelabs.mydemoapp.android:id/loginBtn