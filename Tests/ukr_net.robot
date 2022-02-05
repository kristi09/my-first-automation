*** Settings ***
Documentation   Testing home page for site ukr.net
Library         SeleniumLibrary
Resource    ../Resources/home_KW.robot
Variables    ../Locators/ukr_locators.py
Test Setup        open browser    ${site}  chrome
Test Teardown     close browser

*** Variables ***
${site}=    https://www.ukr.net
${us_email}=   kristinasyvak89@ukr.net
${us_password}=    kristinasyvakzaichik

*** Test Cases ***
Login to ukr.net
    [Documentation]    Checking the login on the site ukr.net
    [Tags]  Login
    select frame    ${login_frame}
    Enter email     ${us_email}
    Enter password  ${us_password}
    click element   ${checkbox}
    click button 'Далі'
    Verify that you successfuly login

Move to the 'exchange rate' tab, calculate 2 dollar to the hryvnia
    [Documentation]    Сhecking dollar exchange rate
    [Tags]  exchange_rate
    click tab 'Валюта'
    enter data into field USD    2
    ${dollar_exchange_rate}=   get text     ${dollar_rate}
    ${2_dollars}=    Evaluate    ${dollar_exchange_rate} * 2
    textfield should contain     ${uah_rate}    ${2_dollars}
    capture page screenshot

Navigation check
    [Documentation]    Check the transition to any category page
    [Tags]  news_categories
    click on the news category link    Головне
    ${url_main_page}=   get location
    run keyword    should contain    ${url_main_page}   ${site}/news/main.html
    wait until element contains    //h2    Головні події України та світу
    click on the news category link    Здоров’я
    ${url_health_page}=     get location
    run keyword    should contain     ${url_health_page}   ${site}/news/health.html
    wait until element contains    //h2  Новини медицини, здоров’я та краси

Horoscope
    [Documentation]    Check the contents of the horoscope
    [Tags]  horoscope_content
    click on the link 'oracle'
    in zodiac block click item     Телець
    switch to opened new tab in browser
    get content for zodiac sign    Телец

Weather
    [Documentation]    Check the weather in the region for 10 days
    [Tags]  weather_content
    select frame    ${weather_frame}
    inside weather block click on city name
    in field search input name city  Хмільник
    Choice CITY in Region   Хмільник    Вінницька обл
    click on weather link for 10 days
    switch to opened new tab in browser
    verify that we on weather page for city     у Хмільнику
    get weather content for city
    @{days}=        get webelements    ${weather_for_10days}
    ${count_days}=  get length    ${days}
    run keyword    should be true    ${count_days}==10

movie poster
    [Documentation]    Find a character in search of a movie poster
    [Tags]  movie_character
    click on the link 'Кіноафіша'
    switch to opened new tab in browser
    hover the mouse over the main burger menu
    click on the drop-down link 'Персони'
    enter to the field 'Пошук по акторам'  Тревіс Фіммел
    press keys  ${search_for_persons_field}    ENTER
    verify that we on person page   Тревіс Фіммел

Find vacancies 'Manual automation engineer' on the site work.ua
    [Documentation]    Check the possibility to find vacancies 'Manual automation engeneer' on the site work.ua
    [Tags]  vacancies_manual_automation_engineer
    maximize browser window
    wait until element is visible    //a[text()='Work.ua']
    click element    //a[text()='Work.ua']
    switch to opened new tab in browser
    wait until element is visible    //a[contains(text(), 'Розширений пошук')]
    click element    //a[contains(text(), 'Розширений пошук')]
    wait until element is visible   //input[@id='city']
    input text    //input[@id='city']   Київ
    select checkbox for     Повна зайнятість
    sleep    1
    select checkbox for     Дистанційна робота
    scroll element into view    //label[text()='Інше']
    select from list by index    salaryfrom_selection   6
    scroll element into view    //a[@id='logo']
    wait until element is visible    //input[@name='search']
    input text   //input[@name='search']      manual automation engineer
    press keys   //input[@name='search']    ENTER
    In vacancy list open each vacancy and view it
    #add a self-test

















