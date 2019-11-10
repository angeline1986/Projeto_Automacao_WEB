*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}            chrome
${URL}                http://automationpractice.com
${TITLE_PAGE}         My Store
# ${CABEÇALHO}          css=.centered-top-container

${CSS_IMG}            css=#center_column > ul > li > div > div.left-block > div > a.product_img_link > img
${TXT_SEARCH}         name=search_query
${BTN_SEARCH}         name=submit_search
${CSS_PAGE}           css=#center_column > h1
${LINK_PRODUCT}       xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),Blouse)]
${MSG_ALERT}          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']


*** Keywords ***
Go to site home
     Open Browser     ${URL}    ${BROWSER}
     Maximize Browser Window
     Title Should Be  ${TITLE_PAGE}


Inform product "${PRODUCT}" in site search
     Input Text         ${TXT_SEARCH}    ${PRODUCT}

Trigger Search
     Click Element      ${BTN_SEARCH}


Validate if "${PRODUCT}" was listed
     Wait Until Element Is Visible   ${CSS_PAGE}
     Page Should Contain Image       ${CSS_IMG}
     Page Should Contain Element     ${LINK_PRODUCT}

Validate Error Message "${MENSAGEM_ALERTA}"
     Wait Until Element Is Visible   ${MSG_ALERT}
     Element Text Should Be          ${MSG_ALERT}       ${MENSAGEM_ALERTA}
