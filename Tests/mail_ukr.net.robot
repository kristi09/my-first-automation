*** Settings ***
Documentation   Testing mail page for site ukr.net
Library         SeleniumLibrary
Resource    ../Resources/home_KW.robot
Variables    ../Locators/ukr_locators.py
Test Setup      run keywords    open browser    ${site}  chrome
...    AND      login to ukr.net as    ${us_email}  ${us_password}
...    AND      click element    ${link_incoming}
...    AND      switch to opened new tab in browser
Test Teardown    close browser

*** Variables ***
${site}=    https://www.ukr.net
${us_email}=   kristinasyvak89@ukr.net
${us_password}=    kristinasyvakzaichik

*** Test Cases ***
Go to mail settings. Add signature to letter
    [Documentation]    Check the presence of the signature
    [Tags]  add_signature_to_letter
    hover mouse to burger menu
    click link 'Senders name and signature'
    enter to the field signature    kris_ti
    click button 'Save change' in mail settings
    click button 'compose a letter'
    check presence signature    kris_ti
#   wait until page contains    kris_ti

Check the "mark as important" feature
    [Documentation]    Check the possibility to mark the link as important - tick
    [Tags]  tick_the_link_in_the_checkbox
    click checkbox for user     Евген
    click link 'yet'
    click drop-down menu link 'note how important'
    click menu link 'marked'
    verify that page contains letter from   Евген
#//td/a[@data-name='Евген']/parent::td//following-sibling::td/div/span












