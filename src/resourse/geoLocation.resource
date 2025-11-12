*** Settings ***
Library   AppiumLibrary

*** Keywords ***
Acessar página Geo Location
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    xpath=//androidx.recyclerview.widget.RecyclerView[@content-desc="Recycler view for menu"]/android.view.ViewGroup[4]/android.widget.TextView
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/locationTV