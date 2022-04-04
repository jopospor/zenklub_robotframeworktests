*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                 chrome 
${URL}                     https://zenklub.com.br/auth/login
${LOGIN_FORM_EMAIL}        login-form-email
${EMAIL}                   qa-automation@zenklub.com
${SENHA}                   qachallenge


*** Keywords ***
Open the browser
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Close the browser
    Capture Page Screenshot
    Close Browser    

That I go into "zenklub.com.br/auth/login"
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${LOGIN_FORM_EMAIL}

Use "${EMAIL}" as email
    Input Text    locator=${LOGIN_FORM_EMAIL}   text=${EMAIL}

"${SENHA}" as password
    Input Text    locator=login-form-password   text=${SENHA}


I need to be able to login on Zenklub website
    Click Element    locator=[data-hs-cf-bound] div span

I have logged in to the Zenklub page
    That I go into "zenklub.com.br/auth/login"
    Use "${EMAIL}" as email
    "${SENHA}" as password

I be redirected to ${URL_SESSIONS}
    Wait Until Location Contains ${URL_SESSIONS}    

I should not have any session scheduled "${NO_SESSIONS_MENSAGE}"
    Wait Until Page Contains "${NO_SESSIONS_MENSAGE}"

that I am on "https://zenklub.com.br/profile/sessions"
    I be redirected to ${URL_SESSIONS}

I click on “NOSSOS ESPECIALISTAS”
     Click Element    locator=nav > .list-unstyled.logged-nav.m-0.ng-star-inserted

I will be redirected to "Encontre seu especialista"
    Wait Until Page Contains    text="Encontre seu especialista"

That I am on /busca page
    I will be redirected to "Encontre seu especialista"

I click on “Gostei quero saber mais” on the first professional that appear on the list
    Click Element    locator=div:nth-of-type(1) > app-professional-search .col-12.d-flex.justify-content-center.professional-link
    
I need to be redirected to professional page that contains the text: "Escolha um horário"
    Wait Until Page Contains    text="Encontre seu especialista"

I am on professional page
    I need to be redirected to professional page that contains the text: "Escolha um horário"

I will able to see more information about the professional and choose and select an hour
    Wait Until Page Contains    text="Perfil"
    I need to be redirected to professional page that contains the text: "Escolha um horário"

that I am on professional page
    I need to be redirected to professional page that contains the text: "Escolha um horário"

I select an hour
    Click Element    locator=.ng-star-inserted:nth-of-type(2) .ng-star-inserted:nth-of-type(1) .slot-time

I need to be redirected to checkout page
    Wait Until Page Contains    text="Métodos de pagamento"