*** Settings ***
Library   AppiumLibrary

*** Keywords ***
Acessar página Reset App State e cancelar
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//androidx.recyclerview.widget.RecyclerView[@content-desc="Recycler view for menu"]/android.view.ViewGroup[7]/android.widget.TextView
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/alertTitle
    Wait Until Page Contains    text=Are you sure you want to Reset the App

Clicar no botão cancel
    Click Element    id=android:id/button2

Validar que o reset foi cancelado
    Wait Until Page Contains    text=Products

Clicar no botão Reset App
    Click Element    id=android:id/button1

Validar que o app foi resetado
    Wait Until Page Contains    text=App State has been reset.
    Click Element    id=android:id/button1
    Wait Until Page Contains    text=Products
