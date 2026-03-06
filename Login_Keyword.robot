*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Success Login
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id=user-name    standard_user
    Input Password    id=password     secret_sauce
    Click Element     //*[@id="login-button"]
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Sleep    3s