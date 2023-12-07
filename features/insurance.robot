*** Settings ***
Documentation    Referente aos testes de Proposta de Seguro

Resource    ../resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

*** Test Case ***
#robot -N "Testes Automatizados CCEE" -d .logs features\insurance.robot
Cenario: Validar registro de proposta de seguro com sucesso
    [Tags]   
    Dado que eu esteja na tela de "Automobile Insurance"
    Quando inicio a inserção dos dados da aba "Enter Vehicle Data" 
    E insiro os dados da aba "Enter Insurante Data"
    E insiro os dados da aba "Enter Product Data"
    E seleciono uma das opções de preco na aba "Select Price Option"
    E insiro os dados para o envio da proposta na aba "Send Quote"
    Então a proposta é enviada para o cadastro efetuado

    