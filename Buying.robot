*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Buying 
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    standard_user
    Input Text    id=password     secret_sauce
    #Click Button    id=login-button
    Click Button     //*[@id="login-button"]
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Button     //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element     //*[@id="shopping_cart_container"]/a
    Click Button     //*[@id="checkout"]
    Input Text     id=first-name   Larina
    Input Text     id=last-name    Keserű
    Input Text     id=postal-code  6100
    Click Button     //*[@id="continue"]
    Click Button     //*[@id="finish"]
    Click Button     //*[@id="back-to-products"]
    Sleep    5s
    Close Browser
    