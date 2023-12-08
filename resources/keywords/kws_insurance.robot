*** Settings ***
Documentation    Referente aos testes de Proposta de Seguro

Resource    ../base.robot

*** Keywords ***    
Dado que eu esteja na tela de "Automobile Insurance"
    Remove File      ${EXECDIR}${/}.logs\\*.png         #Remove arquivos PNG antes de executar o próximo teste
    Carregar site        
    
###### Enter Vehicle Data ######    
Quando inicio a inserção dos dados da aba "Enter Vehicle Data"
    Log To Console     ...\n    
    Log to Console     ==============================================================================
    Log To Console      Inserindo os dados da aba "Enter Vehicle Data"
    Log to Console     ==============================================================================\n
    
    ${date}=         Get Current Date    
    ${date}=         Convert Date	   ${date}	  result_format=%m/%d/%Y
    Set Suite Variable  ${date_manufacture}    ${date}
  
    Wait Until Element Is Visible    ${slc_make}  
    Escolher Modelo
    Click Element                    ${slc_make}
    Wait Until Element Is Visible    xpath=//*[contains(text(),'${modelo_make}')]
    Click Element                    xpath=//*[contains(text(),'${modelo_make}')]
    Gerar Performance
    Click Element                    ${txt_engine_performance}
    Input Text                       ${txt_engine_performance}     ${number_kw}
    Click Element                    ${txt_data_of_manufacture}
    Input Text                       ${txt_data_of_manufacture}    ${date_manufacture}
    Click Element                    ${slc_number_seats}
    Click Element                    xpath://*[@id="numberofseats"]/option[5]
    Escolher Fuel
    Click Element                    ${slc_fuel}
    Wait Until Element Is Visible    xpath=//*[contains(text(),'${fuel_escolhido}')]
    Click Element                    xpath=//*[contains(text(),'${fuel_escolhido}')]
    Gerar Price
    Click Element                    ${txt_list_price}
    Input Text                       ${txt_list_price}              ${number_price}
    Gerar Plate Number
    Click Element                    ${txt_license_plate_number}
    Input Text                       ${txt_license_plate_number}    ${plate_number}
    Gerar Mileage
    Click Element                    ${txt_annual_mileage}
    Input Text                       ${txt_annual_mileage}          ${number_miliage}
    Capture Page Screenshot
    Click Element                    ${btn_next_insurance_data}

###### Enter Insurance Data ######    
E insiro os dados da aba "Enter Insurante Data"    
    Log to Console     ==============================================================================
    Log To Console      Inserindo os dados da aba "Enter Insurante Data"
    Log to Console     ==============================================================================\n
    ${firstname}       FakerLibrary.FirstName
    ${firstname}       Convert To Upper Case    ${first_name}
    Set Suite Variable        ${firstname}
    Set Suite Variable        ${first_name}     ${firstname}
    ${first_name}=      Remove String           ${first_name}    ${SPACE * 1}    
    Set Suite Variable        ${first_name}

    ${lastname}       FakerLibrary.LastName
    ${lastname}       Convert To Upper Case    ${lastname}
    Set Suite Variable        ${lastname}
    ${lastname}=       Remove String            ${lastname}    ${SPACE * 1}    
    
    ${street_adrress}       FakerLibrary.Address
    ${street_adrress}       Convert To Upper Case    ${street_adrress}
    Set Suite Variable        ${street_adrress}

    ${zipcode}              FakerLibrary.Postcode
    Set Suite Variable        ${zipcode}

    ${city}                 FakerLibrary.City
    ${city}       Convert To Upper Case    ${city}
    Set Suite Variable        ${city}

    ${website}              FakerLibrary.Url    
    Set Suite Variable        ${website}
    
    Wait Until Page Contains        First Name
    Click Element                  ${txt_first_name}
    Input Text                     ${txt_first_name}        ${first_name}    
    Click Element                  ${txt_last_name}  
    Input Text                     ${txt_last_name}         ${lastname}
    Capture Page Screenshot        ${EXECDIR}${/}resources\\Evidencias\\${first_name}.png
    Gerar Random Date of Birth
    Click Element                  ${txt_birth_date} 
    Input Text                     ${txt_birth_date}        ${birth_date}
    Click Element                  ${chk_gender_male}
    Click Element                  ${txt_street_address} 
    Input Text                     ${txt_street_address}    ${street_adrress}    
    Click Element                  ${slc_country}
    Sleep  2    
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://*[@id="country"]/option[14]
    Click Element                  xpath://*[@id="country"]/option[14]
    #Click Element                    xpath://span[@class="mat-option-text"][text()="Brazil"]    
    Click Element                  ${txt_zipcode}
    Input Text                     ${txt_zipcode}      ${zipcode}
    Run Keyword And Ignore Error     Scroll Element Into View     ${btn_endpage}    
    Click Element                  ${txt_city}  
    Input Text                     ${txt_city}    ${city}
    Click Element                  ${slc_occupation}
    Sleep  2    
    Wait Until Element Is Visible    xpath://*[@id="occupation"]/option[6]
    Click Element                    xpath://*[@id="occupation"]/option[6]
    Press Keys      NONE     ESC    
    Click Element                  ${chk_skydiving}
    Click Element                  ${txt_website} 
    Input Text                     ${txt_website}           ${website}    
    Choose File                    ${inp_picturecontainer}     ${EXECDIR}${/}resources\\Evidencias\\${first_name}.png    
    Capture Page Screenshot
    Click Element                  ${btn_next_enterproductdata}

#### Enter Product Data ####
E insiro os dados da aba "Enter Product Data"
    Log to Console     ==============================================================================
    Log To Console      Inserindo os dados da aba "Enter Product Data"
    Log to Console     ==============================================================================\n
    ${startdate}=     Get Current Date    
    ${startdate}=     Convert Date	   ${startdate}   
    ${start_date}=      Add Time To Date   ${startdate}    35 days    result_format=%m/%d/%Y
    Set Suite Variable    ${start_date}      
    
    Wait Until Element Is Visible    ${txt_startdate}
    Click Element                    ${txt_startdate}
    Input Text                       ${txt_startdate}           ${start_date}
    Click Element                    ${slc_insurance_sum}
    Click Element                    xpath://*[@id="insurancesum"]/option[7]
    Click Element                    ${slc_merit_rating}
    Click Element                    xpath://*[@id="meritrating"]/option[10]
    Click Element                    ${slc_damage_insurance}
    Click Element                    xpath://*[@id="damageinsurance"]/option[3]
    Click Element                    ${chk_Euro_Protection}
    Click Element                    ${slc_courtesycar}
    Click Element                    xpath://*[@id="courtesycar"]/option[3]        #YES
    # Click Element                    xpath:////*[@id="courtesycar"]/option[2]    #NO
    Capture Page Screenshot
    Click Element                    ${btn_next_select_priceoption}

#### Select Price Option ####
E seleciono uma das opções de preco na aba "Select Price Option"
    Log to Console     ==============================================================================
    Log To Console      Selecionando o preço na aba "Select Price Option"
    Log to Console     ==============================================================================\n   
    Wait Until Element Is Visible    ${chk_select_platinum}
    Click Element                    ${chk_select_platinum}
    Sleep  2    
    Capture Page Screenshot
    Click Element                    ${btn_view_quote}
    Aguardando Loading
    ## Valido as informações da proposta
    ${current_handle}    Get Window Handles                               # Salva o identificador da janela atual        
    Wait Until Keyword Succeeds    5s    1s    Switch Window    NEW       # Muda para a nova janela
    #Validando se a pagina sera impressa corretamente     
    Sleep  10
    Capture Page Screenshot        
    Switch Window    MAIN                                                 # Volta para a janela original
    Sleep  3
    Wait Until Element Is Visible    ${aba_select_price}
    Click Element                    ${aba_select_price}

    Wait Until Element Is Visible    ${btn_next_send_quote}
    Click Element                    ${btn_next_send_quote}

#### Send Quote ####
E insiro os dados para o envio da proposta na aba "Send Quote"
    Log to Console     ==============================================================================
    Log To Console      Inserindo os dados para o envio da proposta na aba "Send Quote"
    Log to Console     ==============================================================================\n
    Gerar Password
    Gera Phone Number

    ${email}       Convert To Lower Case     ${first_name}.${lastname}
    Set Suite Variable     ${email}

    ${username}       Convert To Lower Case     ${lastname}.${first_name}    
    Set Suite Variable     ${username}

    Wait Until Element Is Visible    ${txt_email}
    Click Element                    ${txt_email}
    Input Text                       ${txt_email}                ${email}@ccee.com
    Click Element                    ${txt_phone}
    Input Text                       ${txt_phone}                ${phone_number}
    Click Element                    ${txt_username}
    Input Text                       ${txt_username}             ${username}
    Click Element                    ${txt_password}
    Input Text                       ${txt_password}             ${password}
    Click Element                    ${txt_confirm_password}
    Input Text                       ${txt_confirm_password}     ${password}
    Click Element                    ${txt_Comments}
    Input Text                       ${txt_Comments}     Automated Test for Insurance CCEE  
    Capture Page Screenshot        
    Click Element                    ${btn_send_email}

Então a proposta é enviada para o cadastro efetuado
    Aguardando Loading
    Wait Until Element Is Visible    ${modal_sending_sucess}
    Wait Until Page Contains         Sending e-mail success!
    Capture Page Screenshot
    Remove File      ${EXECDIR}${/}.\\resources\\Evidencias\\*.png         #Remove arquivos PNG depois de executar o teste

################### DADOS VARIÁVEIS DA PROPOSTA ###################
Escolher Modelo
    ${modelos}    Create List    
    ...   Audi    BMW     Ford    Honda    Mazda
    ...   Nissan    Opel    Porsche    Mercedes Benz
    ...   Renault    Skoda    Suzuki    Toyota
    ...   Volkswagen    Volvo

    FOR    ${modelo}    IN    @{modelos}
        ${size}    Evaluate    len(${modelos}) - 1
        ${rand}    FakerLibrary.random int    min=0    max=${size}        
        Set Suite Variable    ${modelo_make}        ${modelos[${rand}]}
        Log    O modelo selecionado foi ${modelo_make}  
    END

Gerar Performance
    ${random_number}=    Evaluate    str(random.randint(1, 2001))
    Set Suite Variable       ${number_kw}       ${random_number}
    
Escolher Fuel
    ${fuel}    Create List
    ...		Petrol    Diesel    Electric Power    Gas    Other
    FOR    ${type}    IN    @{fuel}
        ${size}    Evaluate    len(${fuel}) - 1
        ${rand}    FakerLibrary.random int    min=0    max=${size}        
        Set Suite Variable    ${fuel_escolhido}        ${fuel[${rand}]}
        Log    O Fuel escolhido é ${fuel_escolhido}        
    END
    
Gerar Price
    ${random_number}=    Evaluate    str(random.randint(500, 100000))
    Set Suite Variable     ${number_price}       ${random_number}

Gerar Plate Number
    ${random_number1}=     Generate Random String          1       [NUMBERS]    
    Set Suite Variable     ${1number}        ${random_number1}

    ${random_number2}=     Generate Random String          2       [NUMBERS]    
    Set Suite Variable     ${2numbers}       ${random_number2}

    ${random_3letras}      Generate Random String          3       [LETTERS] 
    ${3letras}=   Convert To Upper Case     ${random_3letras}
    Set Suite Variable     ${3letras}

    ${random_1letra}       Generate Random String          1       [LETTERS] 
    ${1letra}=   Convert To Upper Case     ${random_1letra}
    Set Suite Variable     ${1letra}
    
    ${plate_number}     Set Variable    ${3letras}${1number}${1letra}${2numbers} 
    Set Suite Variable     ${plate_number}

Gerar Mileage
    ${random_number}=    Evaluate    str(random.randint(100, 100000))
    Set Suite Variable     ${number_miliage}       ${random_number}    

Gerar Random Date of Birth
    ${current_year}    Get Current Date    result_format=%Y
    ${birth_year}=       Evaluate    ${current_year} - 18 - random.randint(19, 70)    
    ${birth_month}=      Evaluate    str(random.randint(1, 12)).zfill(2)     
    ${birth_day}=        Evaluate    str(random.randint(1, 31)).zfill(2)
    ${birth_date}    Set Variable   ${birth_month}/${birth_day}/${birth_year}
    Set Suite Variable   ${birth_date}
    # Log To Console  \n.....a Data gerada foi: ${birth_date}

Gerar Password
    ${random_number1}=     Generate Random String          2       [NUMBERS]    
    Set Suite Variable     ${1number}        ${random_number1}

    ${random_number2}=     Generate Random String          2       [NUMBERS]    
    Set Suite Variable     ${2number}       ${random_number2}

    ${random_first}      Generate Random String            1       [LETTERS] 
    ${first_letter}=   Convert To Upper Case     ${random_first}
    Set Suite Variable     ${first_letter}

    ${random_second}       Generate Random String          1       [LETTERS] 
    ${second_letter}=   Convert To Lower Case     ${random_second}
    Set Suite Variable     ${second_letter}
    
    ${password}     Set Variable    ${first_letter}${1number}${second_letter}${2number} 
    Set Suite Variable     ${password}

Gera Phone Number        
    ${random_number}=    Evaluate    str(random.randint(1, 99999999))
    ${random_num}    Set Variable If    ${RANDOM_NUMBER} < 10000000    ${random_number}    ${random_number}
    [Return]    ${random_num}
    Set Suite Variable       ${phone_number}        ${random_num}

###################### FIM DAS VARIÁVEIS #########################
