*** Settings ***
Library   AppiumLibrary

*** Keywords ***
Acessar página Virtual USB
    Click Element    xpath=//*[@content-desc="View menu"]
    Click Element    //androidx.recyclerview.widget.RecyclerView[@content-desc="Recycler view for menu"]/android.view.ViewGroup[9]/android.widget.TextView
    Wait Until Page Contains    text=Virtual USB is a tool developed by Sauce Labs, to allow you 'adb' access to the device. With it, you can use your development suite with a remote device, as if it were connected physically to your computer.