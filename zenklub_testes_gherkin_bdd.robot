*** Settings ***
Documentation    Essa suíte testa o site da zenklub.com.br
Resource         zenklub_resources.robot
Test Setup       Open the browser
Test Teardown    Close the browser

*** Test Cases ***
Test Case 01 - Login
    [Documentation]    This test checks the login to the website zenklub.com.br
    [Tags]             login 
    Given that I access "zenklub.com.br/auth/login"
    And I use qa-automation@zenklub.com as email 
    And I use qachallenge as password 
    Then I needs to be able to login on our website
    When I be redirected to "https://zenklub.com.br/profile/sessions"
    Then I should not have any session scheduled "Você ainda não fez nenhuma sessão. Encontre o profissional perfeito para você ainda hoje"
    When I click on “NOSSOS ESPECIALISTAS”
    Then I will be redirected to "Encontre seu especialista"
    When I click on “Gostei quero saber mais” on the first professional that appear on the list
    Then I need to be redirected to professional page that contains the text: "Escolha um horário"
    When I select an hour
    Then I need to be redirected to checkout page