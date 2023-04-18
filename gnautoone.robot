*** Settings ***
Library  SeleniumLibrary
Variables  ../login/Gnautomation.py
Library  SeleniumLibrary
*** Variables ***
${url}   https://tst-portal-us.gnonlineservices.com/
${browser}  chrome
${user_value}   gnusers
${password_value}   GNCloud@2018
${loop_var}     0
${r_acc_no}   0123456789965
${r_user}   SaiPrudhviReddy
${r_email}  prudhvi@gmail.com
${r_fname}  prudhvi
${r_phone}  630457564543
${r_no_of_countries}  10
${r_no_of_languages}    33
${r_lname}  prudhvi
${log_email}    prudhvi@gmail.com
${log_password}     9755tg975h@
*** Keywords ***
open the browser
    open browser    ${url}  ${browser}
    maximize browser window
enter details
    [Arguments]  ${user_value}    ${password_value}
    input text  ${test_username}      ${user_value}
    input text  ${test_password}     ${password_value}
    click button    ${test_login}
verify login
    page should contain     ${test_login_verify}
verify contact
    click element   ${contact_button}
    page should contain     ${contact_verify}
verify home
    click element   ${home_button}
    page should contain     ${test_login_verify}
verify register
    [Arguments]  ${r_acc_no}  ${r_user}     ${r_email}      ${r_no_of_countries}    ${r_no_of_languages}   ${r_fname}    ${r_phone}    ${r_lname}
    click element   ${register_button}
    page should contain     ${register_verify}
    input text  ${account_no}    ${r_acc_no}
    input text  ${register_username}     ${r_user}
    input text  ${register_email}     ${r_email}
    input text  ${register_fname}        ${r_fname}
    input text  ${register_phone}    ${r_phone}
    FOR    ${loop_var}      IN RANGE  0     13
        select from list by index   ${register_list_country}  ${loop_var}
        ${loop_var}=    evaluate    ${loop_var}+1
    END
    ${loop_var}=   set variable    0
    WHILE   ${loop_var} <${r_no_of_languages}
        select from list by index       ${register_list_languages}  ${loop_var}
        ${loop_var}=    evaluate    ${loop_var}+1
    END
    input text  ${register_conf_email}     ${r_email}
    input text  ${register_lname}     ${r_lname}
    select checkbox     ${register_checkbox}
    click button    ${register_submit}
    page should contain     ${register_verify_invalid}
verify login element
    click element   ${login_button}
    sleep   1
    input text      ${login_email}  ${log_email}
    click button    ${login_next}
    set selenium implicit wait  18seconds
    ${cookie}   run keyword and return status   element should be visible   ${login_cookie}
    IF  ${cookie}
        sleep   1
        click element   ${login_cookie}
    END
    input text  ${login_password}    ${log_password}


    click button    ${login_continue}
    page should contain     ${login_verify}



