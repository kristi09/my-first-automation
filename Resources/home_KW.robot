*** Settings ***
Library         SeleniumLibrary
Variables    ../Locators/ukr_locators.py

*** Keywords ***
open site
    #apart ukr.net
    [Arguments]    ${siteUrl}   ${Browser}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    call method    ${chrome_options}   add_argument    headless
    ${options}=     Call Method     ${chrome_options}    to_capabilities
    open browser    ${siteUrl}  ${Browser}      desired_capabilities=${options}
    set window size    1450    850

login to ukr.net as
    [Arguments]    ${login}    ${password}
    select frame    ${login_frame}
    Enter email     ${login}
    Enter password  ${password}
    click button 'Далі'
    Verify that you successfuly login

switch to opened new tab in browser
    @{windows}=     get window handles
    ${numWindows}=  get length  ${windows}
    ${indexLast}=   evaluate  ${numWindows}-1
    Should Be True  ${numWindows} > 1
    switch window   ${windows}[${indexLast}]

hover mouse to burger menu
   wait until page contains element    ${burger_menu}    15
   mouse over    ${burger_menu}

click link 'Senders name and signature'
   wait until page contains element    ${link_signature}    15
   click element    ${link_signature}

enter to the field signature
   [Arguments]  ${name_signature}
   wait until page contains element    ${field_for_signature}
   input text  ${field_for_signature}    ${name_signature}

click button 'Save change' in mail settings
   wait until page contains element    ${button_save_change}
   click element    ${button_save_change}

click button 'compose a letter'
   wait until page contains element    ${button_to_write_a_letter}
   click button    ${button_to_write_a_letter}

click checkbox for user
   [Arguments]    ${name_user}
   wait until page contains element    //td/a[@data-name='${name_user}']/parent::td//preceding-sibling::td/label/input  15
   click element    //td/a[@data-name='${name_user}']/parent::td//preceding-sibling::td/label/input

verify that page contains letter from
    [Arguments]    ${name_user}
    wait until page contains element    //td/a[@data-name='${name_user}']

click link 'yet'
    wait until page contains element    ${link_yet}
    click element    ${link_yet}

click drop-down menu link 'note how important'
    wait until page contains element    ${drop_down_menu_link_note_how_important}
    click element    ${drop_down_menu_link_note_how_important}

click menu link 'marked'
    wait until page contains element    ${menu_link_marked}
    click element    ${menu_link_marked}

Verify that you successfuly login
    wait until element is visible       ${button_exit}     15
    wait until page contains element    ${user_email}

Enter email
    [Arguments]    ${email}
    wait until page contains element    ${email_field}     15
    input text    ${email_field}     ${email}

Enter password
     [Arguments]    ${password}
     wait until page contains element   ${password_field}      15
     input text    ${password_field}     ${password}

click button 'Далі'
    wait until page contains element    ${button_next}
    click element    ${button_next}

enter data into field USD
    [Arguments]    ${value}
    wait until page contains element    //input[@id='usd']
    input text    //input[@id='usd']    ${value}

click tab 'Валюта'
    wait until element is visible      ${inset_currency}    10
    click element    ${inset_currency}

click on the news category link
  [Arguments]    ${news_category}
  wait until element is visible  //a[text()='${news_category}']    15
  click element    //a[text()='${news_category}']

Check presence signature
    [Arguments]    ${signature}
    select frame    //iframe[@id='mce_0_ifr']
    wait until page contains element    //body[@id='tinymce']/div/span[text()='${signature}']

click on the link 'oracle'
    wait until page contains element    ${link_oracle}
    click element    ${link_oracle}

in zodiac block click item
    [Arguments]    ${zodiac_sign}
    wait until page contains element    //a[text()='${zodiac_sign}']
    click element   //a[text()='${zodiac_sign}']

get content for zodiac sign
    [Arguments]   ${zodiac_name}
    ${zodiac_text}=     get text    //h1[text()='${zodiac_name}']//following-sibling::div/p[@class]

Choice CITY in Region
    [Arguments]    ${city}      ${region}
    wait until page contains element    //li[contains(text(), '${city}')]/span[contains(text(),'${region}')]
    click element    //li[contains(text(), '${city}')]/span[contains(text(),'${region}')]

verify that we on weather page for city
    [Arguments]    ${city}
    wait until element is visible    //h1/strong[text()='${city}']      15

inside weather block click on city name
    wait until page contains element    ${city_search}
    click element    ${city_search}

in field search input name city
    [Arguments]    ${name_city}
    wait until page contains element    ${field_search}
    input text  ${field_search}     ${name_city}

click on weather link for 10 days
    wait until element is visible    ${link_10_days}
    click element    ${link_10_days}

get weather content for city
    wait until element is visible     ${weather_description}
    ${weather_text}=     get text     ${weather_description}

enter to the field 'Пошук по акторам'
   [Arguments]  ${name_character}
   wait until element is visible    ${search_for_persons_field}
   input text    ${search_for_persons_field}    ${name_character}

click on the link 'Кіноафіша'
    wait until element is visible   ${link_movie_poster}
    click element   ${link_movie_poster}

hover the mouse over the main burger menu
    wait until page contains element    ${header_burger_menu}
    mouse over    ${header_burger_menu}

click on the drop-down link 'Персони'
    wait until element is visible    ${drop_down_link_persons}
    click element    ${drop_down_link_persons}

verify that we on person page
    [Arguments]    ${person_name}
    wait until element is visible    //a[text()='${person_name}']

select checkbox for
    [Arguments]   ${type_of_employment}
    wait until element is visible    //span[text()='${type_of_employment}']//preceding-sibling::input[@type='checkbox']
    click element    //span[text()='${type_of_employment}']//preceding-sibling::input[@type='checkbox']

In vacancy list open each vacancy and view it
    wait until page contains element       //h2/a     timeout= 30s
    @{TICKET_ABBR}=    get webelements     //h2/a
    FOR    ${item}    IN    @{TICKET_ABBR}
    wait until page contains element    ${item}     10
    run keyword    click element    ${item}
    sleep    2
    go back
    Execute JavaScript    window.scrollBy(0,500)
    sleep    2
    END







