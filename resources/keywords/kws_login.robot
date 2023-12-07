*** Settings ***

Resource    ../base.robot


*** Keywords ***
Dado que eu acesse o site da "Tricentis"
     Wait Until Page Contains        Vehicle Insurance Application         
    
Quando a página for carregada corretamente
    Wait Until Element Is Visible    ${slc_make}

Então a página estará pronta para iniciar a proposta
    Wait Until Page Contains         Make
    Capture Page Screenshot
    Reload Page
    Wait Until Page Contains         7

Carregar site
    Dado que eu acesse o site da "Tricentis"
    Quando a página for carregada corretamente
    Então a página estará pronta para iniciar a proposta
    
