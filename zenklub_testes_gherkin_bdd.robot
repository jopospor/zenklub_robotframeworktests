*** Settings ***
Documentation    Essa suíte testa o site da zenklub.com.br
Resource         zenklub_resources.robot
Test Setup       Open the browser
Test Teardown    Close the browser

*** Test Cases ***
Test Case 01 - Login
    [Documentation]    This test checks the login to the website zenklub.com.br
    [Tags]             login
    Given that I go into "zenklub.com.br/auth/login"
    And use "qa-automation@zenklub.com" as email
    And "qachallenge" as password
    Then I need to be able to login on Zenklub website 

Test Case 02 - Pesquisa de um Produto
    [Documentation]    This test verify sessions scheduled 
    [Tags]             sessions_scheduled
    Given I have logged in to the Zenklub page
    When I be redirected to "https://zenklub.com.br/profile/sessions"
    Then I should not have any session scheduled "Você ainda não fez nenhuma sessão. Encontre o profissional perfeito para você ainda hoje"

Test Case 03 - Pesquisa de um Produto
    [Documentation]    This test validates if the page is redirected to /busca
    [Tags]             busca
    Given that I am on "https://zenklub.com.br/profile/sessions"
    When I click on “NOSSOS ESPECIALISTAS”
    Then I will be redirected to "Encontre seu especialista"
  

Test Case 04 - Adicionar Produto no Carrinho
    [Documentation]    This test validates if the page is redirected to the professional's page
    [Tags]             professional_page
    Given that I am on /busca page
    When I click on “Gostei quero saber mais” on the first professional that appear on the list
    Then I need to be redirected to professional page that contains the text: "Escolha um horário"

Test Case 05 - Remover Produto do Carrinho
    [Documentation]    This test checks if I  can see more information about the professional he chose and select an hour
    [Tags]             professional_information select_hour
    When I am on professional page
    Then I will able to see more information about the professional and choose and select an hour

Test Case 06 - Remover Produto do Carrinho
    [Documentation]    This test validate that I am on the checkout page
    [Tags]             select_hour  checkout_page
    Given that I am on professional page
    When I select an hour
    Then I need to be redirected to checkout page
   