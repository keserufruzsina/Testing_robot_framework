*** Settings ***
Library           SeleniumLibrary
Library           Collections
Resource          Login_Keyword.robot

*** Test Cases ***
Empty username checkout
    Success Login
    Click Element     //*[@id="shopping_cart_container"]/a
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     id=checkout
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Input Text    id=postal-code    6100
    Click Element     id=continue
    Page Should Contain     Error: First Name is required
    Sleep     3s
    Close Browser

Epmty postalcode checkout
    Success Login
    Click Element     //*[@id="shopping_cart_container"]/a
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     id=checkout
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Input Text    id=first-name    Hát
    Input Text    id=last-name    Izsák
    Click Element     id=continue
    Page Should Contain     Error: Postal Code is required
    Sleep     3s
    Close Browser

All epmty checkout
    Success Login
    Click Element     //*[@id="shopping_cart_container"]/a
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     id=checkout
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     id=continue
    Page Should Contain     Error: First Name is required
    Sleep     3s
    Close Browser

Too long name checkout
    Success Login
    Click Element     //*[@id="shopping_cart_container"]/a
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     id=checkout
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    ${long_name}=            Evaluate     "A" * 10000
    Input Text    id=first-name    ${long_name}
    Input Text    id=last-name    ${long_name}
    Input Text    id=postal-code    6100
    Click Element     id=continue
    Page Should Contain     Error: hibara kell futatni

Special characters checkout
    Success Login
    Click Element     //*[@id="shopping_cart_container"]/a
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     id=checkout
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Input Text    id=first-name    !@#$%^&*()_+
    Input Text    id=last-name    !@#$%^&*()_+
    Input Text    id=postal-code    6100
    Click Element     id=continue
    Page Should Contain     Error: hibara kell futatni

Numbers in name checkout
    Success Login
    Click Element     //*[@id="shopping_cart_container"]/a
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     id=checkout
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Input Text    id=first-name    1234567890
    Input Text    id=last-name    1234567890
    Input Text    id=postal-code    6100
    Click Element     id=continue
    Page Should Contain     Error: hibara kell futatni

Cancel button checkout
    Success Login
    Click Element     //*[@id="shopping_cart_container"]/a
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     id=checkout
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     id=cancel
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Sleep     3s
    Close Browser

Success checkout
    Success Login
    Click Element     //*[@id="shopping_cart_container"]/a
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     id=checkout
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Input Text    id=first-name    Hát
    Input Text    id=last-name    Izsák
    Input Text    id=postal-code    6100
    Click Element     id=continue
    Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Element     //*[@id="finish"]
    Sleep     3s
    Close Browser
    