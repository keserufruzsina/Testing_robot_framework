#1. Shopping cart functionality
#    Add multiple products
#    Remove products from the shopping cart
#    Check the contents of the shopping car

*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Shopping cart functionality
    Success Login
    Add items to cart
    Check the number of elemets    3
    Close Browser

Remove products from the shopping cart
    Success Login
    Add items to cart
    Check the number of elemets    3
    Delete
    Check the number of elemets    2
    Close Browser

*** Keywords ***
Success Login
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id=user-name    standard_user
    Input Password    id=password     secret_sauce
    Click Element     //*[@id="login-button"]
    Sleep    3s

Add items to cart
     Page Should Contain Element     //*[@id="shopping_cart_container"]/a
    Click Button     //*[@id="add-to-cart-sauce-labs-backpack"]
    Sleep    3s
    Click Button     //*[@id="add-to-cart-sauce-labs-bike-light"]
    Sleep    3s
    Click Button     //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Sleep    3s
    Element Should Contain        class:shopping_cart_badge    3
    Click Element     class:shopping_cart_link
    Sleep    3s

Delete
    Click Element     //*[@id="remove-sauce-labs-backpack"]
    Sleep    3s


Check the number of elemets
    [Arguments]    ${expected_counts}
    ${count_items}=    Get Element Count     class:cart_item
    Should Be Equal As Numbers     ${count_items}    ${expected_counts}