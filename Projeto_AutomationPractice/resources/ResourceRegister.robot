*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                chrome
${URL}                    http://automationpractice.com
${TITLE_PAGE}             My Store

# ${URL_EMAIL}          https://www.mohmal.com/pt
# ${BTN_GENERATE_EMAIL}   css=a#rand.btn.btn-primary
${URL_EMAIL}              http://www.moakt.com/pt
${BTN_GENERATE_EMAIL}     css=input.mail_butt
${COPY_EMAIL}             css=span#copy-email
${EMAIL_GENERATE}
${CSS_EMAIL_GENERATE}     css=#email-address
${EMAIL_GENERATE_SET}

${BTN_SIGNIN}             css=a.login
${TXT_EMAIL}              css=input#email_create
${BTN_CREAT_ACOUNT}       css=button#SubmitCreate
${CONFIRMATION_ACOUNT}    Welcome to your account. Here you can manage all of your personal information and orders.

#CSS Form Cadastro
${CSS_FIRST_NAME}         css=#customer_firstname
${CSS_LAST_NAME}          css=#customer_lastname
${CSS_PASSWORD}           css=#passwd
${CSS_ADDRESS}            css=input#address1
${CSS_CITY}               css=input#city
${CSS_STATE}              css=select#id_state
${CSS_STATE2}             xpath=//select[@name="id_state"]/option[@value=3]
${CSS_ZIPCODE}            css=input#postcode
${CSS_MOBILEPHONE}        css=input#phone_mobile
${CSS_ADDRESS_ALIAS}      css=input#alias
${CSS_BTN_SUBMIT}         css=button#submitAccount
${PAGE_FORM}              css=h1.page-heading
${CSS_WELCOME}            css=p.info-account
${CSS_LIST_ACCOUNT}       css=ul.myaccount-link-list

#Dados de Cadastro
${FIRST_NAME}             Maria
${LAST_NAME}              Mercedes
${PASSWORD}               A123456789
${ADDRESS}                West Village
${CITY}                   Roosevelt
${ZIPCODE}                86039
${MOBILEPHONE}            +1 212-463-9653
${ADDRESS_ALIAS}          West Garden



*** Keywords ***
Access the disposable email site
     Open Browser         ${URL_EMAIL}   ${BROWSER}
     Maximize Browser Window
     Click Element        ${BTN_GENERATE_EMAIL}
     Wait Until Element Is Visible       ${COPY_EMAIL}
     ${EMAIL_GENERATE}    Get Text       ${CSS_EMAIL_GENERATE}
     Set Suite Variable   ${EMAIL_GENERATE_SET}   ${EMAIL_GENERATE}

Start registration
     Open Browser     ${URL}             ${BROWSER}
     Maximize Browser Window
     Click Element    ${BTN_SIGNIN}
     Wait Until Element Is Visible       ${TXT_EMAIL}
     Input Text       ${TXT_EMAIL}       ${EMAIL_GENERATE_SET}
     Click Element    ${BTN_CREAT_ACOUNT}

Fill in registration form
     Wait Until Element Is Visible  ${PAGE_FORM}
     Sleep  3s
     Input Text                     ${CSS_FIRST_NAME}     ${FIRST_NAME}
     Input Text                     ${CSS_LAST_NAME}      ${LAST_NAME}
     Input Text                     ${CSS_PASSWORD}       ${PASSWORD}
     Input Text                     ${CSS_ADDRESS}        ${ADDRESS}
     Input Text                     ${CSS_CITY}           ${CITY}
     Click Element                  ${CSS_STATE2}
     Input Text                     ${CSS_ZIPCODE}        ${ZIPCODE}
     Input Text                     ${CSS_MOBILEPHONE}    ${MOBILEPHONE}
     Input Text                     ${CSS_ADDRESS_ALIAS}  ${ADDRESS_ALIAS}
     Click Element                  ${CSS_BTN_SUBMIT}


Manage account data
     Wait Until Element Is Visible  ${CSS_LIST_ACCOUNT}
     Page Should Contain Element    ${CSS_WELCOME}

Check Success Message
     ${CSS_WELCOME_TEXT}    Get Text       ${CSS_WELCOME}
     Should Be Equal As Strings     ${CSS_WELCOME_TEXT}    ${CONFIRMATION_ACOUNT}



Close Browser
     Close All Browsers
