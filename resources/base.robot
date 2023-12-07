
*** Variables ***
#######################################################################
##                                                                   ##
##                 Configuração de Ambiente                          ##
##                                                                   ##
## ####################################################################

*** Settings ***
########################################################################
##                                                                    ##     
##                    Libraries de todo o projeto                     ##
##                                                                    ##
## #####################################################################
## Criado por: Augusto Oliveira     		       					  ##
## Data: 06/12/2023							                          ##
## Área: Automated Tests                                              ##
## Projeto: CCEE                                                      ##
## #####################################################################

Library         SeleniumLibrary
Library         String
#Library         FakerLibrary    locale=pt_BR
Library         FakerLibrary    locale=en_US
Library         OperatingSystem
Library         DatabaseLibrary
Library         SoapLibrary
Library         RequestsLibrary
Library         Collections
Library         DateTime
Library         DebugLibrary
Library         Process
Library         JSONLibrary
#Library         libs/DateOfBirthLibrary.py

########################################################
#                        Hooks                         #
########################################################
Resource    hooks.robot

########################################################
#                      Pages Web                       #
########################################################
Resource    pages/insurance_page.robot

########################################################
#                      Keywords Web                    #
########################################################
Resource    keywords/kws_insurance.robot
Resource    keywords/kws_login.robot

