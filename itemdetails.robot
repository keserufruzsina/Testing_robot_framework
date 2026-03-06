*** Settings ***
Library           SeleniumLibrary
Library           Collections
Resource          Login_Keyword.robot

*** Test Cases ***
Open item with name
    Success Login
    Click Element     //*[@id="item_4_title_link"]/div
    Page Should Contain Element     //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    Sleep     3s
    Close Browser

Open item with pic
    Success Login
    Click Element     //*[@id="item_4_img_link"]/img
    Page Should Contain Element     //*[@id="inventory_item_container"]/div/div/div[1]/img
    Sleep     3s
    Close Browser

Check same name
    Success Login
    ${item_name}=    Get Text     //*[@id="item_4_title_link"]/div
    Click Element     //*[@id="item_4_title_link"]/div
    Page Should Contain     ${item_name}
    Sleep     3s
    Close Browser

Check same price
    Success Login
    ${item_price}=    Get Text     //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Click Element         //*[@id="item_4_title_link"]/div
    Page Should Contain     ${item_price}
    Sleep     3s
    Close Browser

Check the desription
    Success Login
    ${item_description}=    Get Text     //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div[1]
    Click Element         //*[@id="item_4_title_link"]/div
    Page Should Contain     ${item_description}
    Sleep     3s
    Close Browser

Check the picture
    Success Login
    ${item_pic1}=    Get Element Attribute     //*[@id="item_4_img_link"]/img     attribute=src
    Click Element         //*[@id="item_4_title_link"]/div
    ${item_pic2}=    Get Element Attribute     //*[@id="inventory_item_container"]/div/div/div[1]/img     attribute=src
    Should Be Equal     ${item_pic1}    ${item_pic2}
    Sleep     3s
    Close Browser

Back to products
    Success Login
    Click Element     //*[@id="item_4_title_link"]/div
    Page Should Contain Element     //*[@id="back-to-products"]
    Sleep     3s
    Click Element     //*[@id="back-to-products"]
    Page Should Contain Element     //*[@id="item_4_title_link"]/div
    Sleep     3s
    Close Browser