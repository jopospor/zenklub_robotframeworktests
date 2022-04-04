*** Settings ***
Documentation    Essa suíte testa o site da zenklub.com.br
Resource         zenklub_resources.robot
Test Setup       Open the browser
Test Teardown    Close the browser

*** Test Cases ***
Test Case 01 - Login
    [Documentation]    This test checks the login to the website zenklub.com.br
    [Tags]             login
    Access "zenklub.com.br/auth/login"
    Login
    Click on “NOSSOS ESPECIALISTAS” he will be redirected to /busca
    Click on “Gostei quero saber mais” on the first professional that appear on the list
    Needs to see more information about the professional he chose, select an hour and validate checkout page
    Clear test date