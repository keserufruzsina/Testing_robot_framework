*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Success Login
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id=user-name    standard_user
    Input Password    id=password     secret_sauce
    Click Element     //*[@id="login-button"]
    Sleep    3s