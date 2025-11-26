*** Settings ***
Library   AppiumLibrary

*** Keywords ***
Acessar página Web View
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//androidx.recyclerview.widget.RecyclerView[@content-desc="Recycler view for menu"]/android.view.ViewGroup[2]/android.widget.TextView
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/webViewTV

Acessar outro site
    [Arguments]    ${site}
    Input Text    id=com.saucelabs.mydemoapp.android:id/urlET    text=${site}
    Click Element    id=com.saucelabs.mydemoapp.android:id/goBtn
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/webView