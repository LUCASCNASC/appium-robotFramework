*** Settings ***
Library   AppiumLibrary

*** Keywords ***
Acessar página FinterPrint
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//androidx.recyclerview.widget.RecyclerView[@content-desc="Recycler view for menu"]/android.view.ViewGroup[8]/android.widget.TextView
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/alertTitle
    Click Element    id=android:id/button1
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/bioMetricTV