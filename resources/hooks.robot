*** Settings ***

Resource        ./base.robot

*** Variables ***
${CLOUD}                    false
${browser}                  chrome

####### TST
${PORTAL}          https://sampleapp.tricentis.com/101/app.php
${PDF_PROPOSTA}    https://sampleapp.tricentis.com/101/tcpdf/pdfs/quote.php

*** Keywords ***
Open Session    
    Open Browser    about:blank    ${browser}    options=add_experimental_option('excludeSwitches', ['enable-logging'])
    Set Selenium Timeout    30
    Set Window Size                 1280    1030        #1366       780       
    Set Window Position             1285     0    
    Go To                   ${PORTAL}    
    #Maximize Browser Window    

Close Session
    Capture Page Screenshot
    Close Browser

Aguardando Loading
    Wait Until Page Contains                Loading...
    Capture Page Screenshot
    Wait Until Page Does Not Contain        Loading...



    
    