*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/gnautoone.robot
*** Test Cases ***
GN PORTAL
    open the browser
    enter details   ${user_value}    ${password_value}
    verify login
    verify contact
    verify home
    verify register     ${r_acc_no}  ${r_user}     ${r_email}      ${r_no_of_countries}    ${r_no_of_languages}   ${r_fname}    ${r_phone}    ${r_lname}
    verify login element