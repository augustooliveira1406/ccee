*** Settings ***
Documentation    PageInspect da Tela Automobile Insurance

Resource    ../base.robot

*** Variables ***

#### Enter Vehicle Data

${slc_make}                       id:make
${txt_engine_performance}         id:engineperformance
${txt_data_of_manufacture}        id:dateofmanufacture
${slc_number_seats}               id:numberofseats
${slc_fuel}                       id:fuel
${txt_list_price}                 id:listprice
${txt_license_plate_number}       id:licenseplatenumber
${txt_annual_mileage}             id:annualmileage
${btn_next_insurance_data}        id:nextenterinsurantdata

#### Enter Insurant Data
${txt_first_name}                 id:firstname
${txt_last_name}                  id:lastname
${txt_birth_date}                 id:birthdate
${chk_gender_male}                xpath://*[@id="insurance-form"]/div/section[2]/div[4]/p/label[1]/span     #id:gendermale
${chk_gender_female}              id:genderfemale
${txt_street_address}             id:streetaddress
${slc_country}                    xpath://html/body/div[1]/div/div[1]/div/div/form/div/section[2]/div[6]/select    #id:country
${txt_zipcode}                    id:zipcode
${txt_city}                       id:city
${slc_occupation}                 id:occupation
${chk_speeding}                   xpath://html/body/div[1]/div/div[1]/div/div/form/div/section[2]/div[10]/p/label[4]/span   #id:speeding
${chk_bungeejumping}              id:bungeejumping
${chk_cliffdiving}                id:cliffdiving
${chk_skydiving}                  xpath://*[@id="insurance-form"]/div/section[2]/div[10]/p/label[4]/span    #id:skydiving
${chk_other}                      id:other
${txt_website}                    id:website
${inp_picturecontainer}           id:picturecontainer
${btn_return_vehicledata}         id:preventervehicledata
${btn_next_enterproductdata}      id:nextenterproductdata
${btn_endpage}                    id:tricentis_services

#### Enter Product Data
${txt_startdate}                  id:startdate            
${slc_insurance_sum}              id:insurancesum
${slc_merit_rating}               id:meritrating
${slc_damage_insurance}           id:damageinsurance
${chk_Euro_Protection}            xpath://*[@id="insurance-form"]/div/section[3]/div[5]/p/label[1]/span     #id:EuroProtection
${chk_Legal_Defense_Insurance}    id:LegalDefenseInsurance
${slc_courtesycar}                id:courtesycar
${btn_return_insurance_data}      id:preventerinsurancedata
${btn_next_select_priceoption}    id:nextselectpriceoption

#### Select Price Option
${aba_select_price}               id:selectpriceoption
${chk_select_silver}              id:selectsilver
${chk_select_gold}                id:selectgold
${chk_select_platinum}            xpath://*[@id="priceTable"]/tfoot/tr/th[2]/label[3]/span    #id:selectplatinum
${chk_select_ultimate}            id:selectultimate
${btn_view_quote}                 xpath://*[@id="viewquote"]/span/i   #id:viewquote                   
${btn_download_quote}             id:downloadquote               
${btn_return_product_data}        id:preventerproductdata
${btn_next_send_quote}            id:nextsendquote             

#### Send Quote
${txt_email}                      id:email
${txt_phone}                      id:phone
${txt_username}                   id:username
${txt_password}                   id:password                
${txt_confirm_password}           id:confirmpassword
${txt_Comments}                   id:Comments                
${btn_return_price_option}        id:prevselectpriceoption
${btn_send_email}                 id:sendemail

${modal_sending_sucess}           xpath://html/body/div[4]
${btn_ok}                         xpath:/html/body/div[4]/div[7]/div/button



