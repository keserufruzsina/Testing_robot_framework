*** Settings ***
Library           SeleniumLibrary
Library           Collections
Resource          Login_Keyword.robot


*** Test Cases ***
    #A–Z rendezés
    #Z–A rendezés
    #Ár szerint növekvő
    #Ár szerint csökkenő

Sorting Z to A
    Success Login
    Click Element     class:product_sort_container
    Click Element     //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${products_names}=   Get All Products names
    Verify Z to A    ${products_names}
    Close Browser

Sorting A to Z
    Success Login
    Click Element     class:product_sort_container
    Click Element     //*[@id="header_container"]/div[2]/div/span/select/option[1]
    ${products_names}=   Get All Products names
    Verify A to Z    ${products_names}
    Close Browser

Sorting Price low to high
    Success Login
    Click Element     class:product_sort_container
    Click Element     //*[@id="header_container"]/div[2]/div/span/select/option[3]
    ${products_price}=   Get All Products price
    Verify Price low to high    ${products_price}
    Sleep    3s    
    Close Browser

Sorting Price high to low
    Success Login
    Click Element     class:product_sort_container
    Click Element     //*[@id="header_container"]/div[2]/div/span/select/option[4]
    ${products_price}=   Get All Products price
    Verify Price high to low    ${products_price}
    Sleep    3s    
    Close Browser

*** Keywords ***
Get All Products names
    ${products}=    Create List
    @{products_elements}=    Get WebElements     class:inventory_item_name
    FOR    ${elements}    IN    @{products_elements}
        ${product_name}=    Get Text    ${elements}
        Append To List    ${products}    ${product_name}
    END
    RETURN    @{products}

Get All Products price
    ${products}=    Create List
    @{products_elements}=    Get WebElements     //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div[2]
    FOR    ${elements}    IN    @{products_elements}
        ${product_price}=    Get Text    ${elements}
        Append To List    ${products}    ${product_price}
    END
    RETURN    @{products}

Verify Z to A
    [Arguments]    ${products_names}
    ${length}=     GET Length    ${products_names}
    FOR    ${index}    IN RANGE     0    ${length}-1
        ${current}=   Get From List    ${products_names}    ${index}
        ${next}=      Get From List    ${products_names}    ${index+1}

        Should Be True    '${current}' >= '${next}'     Products are not in Z to A order: current: ${current}, next: ${next} 
    END

Verify A to Z
    [Arguments]    ${products_names}
    ${length}=     GET Length    ${products_names}
    FOR    ${index}    IN RANGE     0    ${length}-1
        ${current}=   Get From List    ${products_names}    ${index}
        ${next}=      Get From List    ${products_names}    ${index+1}

        Should Be True    '${current}' <= '${next}'     Products are not in A to Z order: current: ${current}, next: ${next} 
    END

Verify Price low to high
    [Arguments]    ${products_price}
    ${length}=     GET Length    ${products_price}
    FOR    ${index}    IN RANGE     0    ${length}-1
        ${current}=   Get From List    ${products_price}    ${index}
        ${next}=      Get From List    ${products_price}    ${index+1}

        Should Be True    ${current} <= ${next}     Products are not in Price low to high order: current: ${current}, next: ${next} 
    END

Verify Price high to low
    [Arguments]    ${products_price}
    ${length}=     GET Length    ${products_price}
    FOR    ${index}    IN RANGE     0    ${length}-1
        ${current}=   Get From List    ${products_price}    ${index}
        ${next}=      Get From List    ${products_price}    ${index+1}

        Should Be True    ${current} >= ${next}     Products are not in Price high to low order: current: ${current}, next: ${next} 
    END
    
