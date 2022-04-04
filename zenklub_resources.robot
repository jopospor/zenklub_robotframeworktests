*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                 chrome 
${URL}                     https://zenklub.com.br/auth/login
${LOGIN_FORM_EMAIL}        login-form-email
${EMAIL}                   qa-automation@zenklub.com
${LOGIN_FORM_PASSWORD}     login-form-password
${SENHA}                   qachallenge


*** Keywords ***
Open the browser
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Close the browser
    
    Close Browser    

Access "zenklub.com.br/auth/login"
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${LOGIN_FORM_EMAIL}

Login
    Input Text    locator=${LOGIN_FORM_EMAIL}  text=${EMAIL}
    Input Text    locator=${LOGIN_FORM_PASSWORD}  text=${SENHA}
    Click Element    locator=//span[@class='zk-button zk-rounded-full zk-font-thick zk-flex zk-justify-center zk-items-center zk-w-full zk-transition zk-duration-300 zk-text-center zk-uppercase ng-tns-c42-0 ng-trigger ng-trigger-loading zk-cursor-pointer active:zk-bg-primary hover:zk-bg-primary-light hover:zk-text-white-base zk-bg-primary zk-text-white-base zk-h-12'][contains(.,'Entrar')]
    Wait Until Element Is Visible    locator=(//span[contains(.,'Você ainda não fez nenhuma sessão. Encontre o profissional perfeito para você ainda hoje')])[2]

Click on “NOSSOS ESPECIALISTAS” he will be redirected to /busca
    Wait Until Element Is Visible    locator=//span[contains(.,'Nossos Especialistas')]
    Click Element    locator=//span[contains(.,'Nossos Especialistas')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Encontre seu especialista')]

Click on “Gostei quero saber mais” on the first professional that appear on the list
    Wait Until Element Is Visible    locator=(//a[contains(.,'Gostei 💜 quero saber mais!')])[1]
    Click Element    locator=(//a[contains(.,'Gostei 💜 quero saber mais!')])[1]

Needs to see more information about the professional he chose, select an hour and validate checkout page
    Wait Until Page Contains    text=Perfil
    Wait Until Element Is Visible    locator=(//a[@class='slot-time ng-star-inserted'])[1]
    Click Element    locator=(//a[@class='slot-time ng-star-inserted'])[1]
    Wait Until Element Is Visible    locator=//h3[contains(.,'Métodos de pagamento')]

Clear test date
    Wait Until Element Is Visible    locator=//span[contains(.,'Minhas Sessões')]
    Click Element    locator=//span[contains(.,'Minhas Sessões')]
    Wait Until Element Is Visible    locator=//button[contains(.,'Cancelar')]
    Click Element    locator=//button[contains(.,'Cancelar')]
    Wait Until Element Is Visible    locator=//button[contains(.,'Confirmar')]
    Click Element    locator=//button[contains(.,'Confirmar')]
    Wait Until Element Is Visible    locator=(//span[contains(.,'Você ainda não fez nenhuma sessão. Encontre o profissional perfeito para você ainda hoje')])[2]


# GHERKIN STEPS

that I access "zenklub.com.br/auth/login"
    Access "zenklub.com.br/auth/login"

I use qa-automation@zenklub.com as email
    Input Text    locator=${LOGIN_FORM_EMAIL}  text=${EMAIL}

I use qachallenge as password 
    Input Text    locator=${LOGIN_FORM_PASSWORD}  text=${SENHA}

I needs to be able to login on our website
    Click Element    locator=//span[@class='zk-button zk-rounded-full zk-font-thick zk-flex zk-justify-center zk-items-center zk-w-full zk-transition zk-duration-300 zk-text-center zk-uppercase ng-tns-c42-0 ng-trigger ng-trigger-loading zk-cursor-pointer active:zk-bg-primary hover:zk-bg-primary-light hover:zk-text-white-base zk-bg-primary zk-text-white-base zk-h-12'][contains(.,'Entrar')]

I be redirected to "https://zenklub.com.br/profile/sessions"
    Wait Until Element Is Visible    locator=//button[contains(.,'Agendar Sessão')]

I should not have any session scheduled "Você ainda não fez nenhuma sessão. Encontre o profissional perfeito para você ainda hoje"    
    Wait Until Element Is Visible    locator=(//span[contains(.,'Você ainda não fez nenhuma sessão. Encontre o profissional perfeito para você ainda hoje')])[2]

I click on “NOSSOS ESPECIALISTAS”
    Click on “NOSSOS ESPECIALISTAS” he will be redirected to /busca

I will be redirected to "Encontre seu especialista"
    Wait Until Element Is Visible    locator=//h1[contains(.,'Encontre seu especialista')]

I click on “Gostei quero saber mais” on the first professional that appear on the list
    Click on “Gostei quero saber mais” on the first professional that appear on the list

I need to be redirected to professional page that contains the text: "Escolha um horário"
    Wait Until Page Contains    text=Perfil
    Wait Until Element Is Visible    locator=(//a[@class='slot-time ng-star-inserted'])[1]

I select an hour
    Wait Until Element Is Visible    locator=(//a[@class='slot-time ng-star-inserted'])[1]
    Click Element    locator=(//a[@class='slot-time ng-star-inserted'])[1]

I need to be redirected to checkout page
    Wait Until Element Is Visible    locator=//h3[contains(.,'Métodos de pagamento')]
    Clear test date
