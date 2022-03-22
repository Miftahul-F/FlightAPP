*** Settings ***
Documentation           Order test cases
Library                 AppiumLibrary
Resource                PageObject/login.robot
Resource                PageObject/header.robot
Suite Setup             Open Flight Application
Suite Teardown          Close Application

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     8.1
${DEVICE_NAME}          emulator-5554
${APP_PACKAGE}          com.example.myapplication
${APP_ACTIVITY}         com.example.myapplication.MainActivity


*** Test Cases ***
User Should be able to book a flight
    Login with valid username and password   
    Click book button      
    Choose departure city                   departure_city=Toronto
    Choose arrival city                     arrival_city=Paris
    Choose flight class                     flight_class=Business
    Choose flight start date                start_date=05 August 2019
    Choose flight end date                  end_date=20 August 2019
    Click flight appPackage
    Click flight day                        day=${true}
    Click book button on order page
    Choose flight price
    Click confirm order
    Verify book order is success

*** Keywords ***
Open Flight Application
    Open Application                ${REMOTE_URL}	
    ...                             platformName=${PLATFORM_NAME}
    ...                             platformVersion=${PLATFORM_VERSION}
    ...                             deviceName=${DEVICE_NAME}
    ...                             appPackage=${APP_PACKAGE}
    ...                             appActivity=${APP_ACTIVITY}

Choose departure city
    [Arguments]                          ${departure_city}
    Click Element                        id=com.example.myapplication:id/spinnerFrom
    Wait Until Page Contains Element     xpath=//*[@text="${departure_city}"]
    Click Element                        xpath=//*[@text="${departure_city}"]

Choose arrival city
    [Arguments]                          ${arrival_city}
    Click Element                        id=com.example.myapplication:id/spinnerTo
    Wait Until Page Contains Element     xpath=//*[@text="${arrival_city}"]
    Click Element                        xpath=//*[@text="${arrival_city}"]

Choose flight class
    [Arguments]                          ${flight_class}
    Click Element                        com.example.myapplication:id/spinnerClass
    Wait Until Page Contains Element     xpath=//*[@text="${flight_class}"] 
    Click Element                        xpath=//*[@text="${flight_class}"] 

Choose flight start date
    [Arguments]                           ${start_date}
    Click ELement                        id=com.example.myapplication:id/textStartDate
    Wait Until Page Contains Element     xpath=//android.view.View[@content-desc="${start_date}"]
    Click Element                        xpath=//android.view.View[@content-desc="${start_date}"]
    Click Element                        id=android:id/button1

Choose flight end date
    [Arguments]                           ${end_date}
    Click Element                        id=com.example.myapplication:id/textEndDate
    Wait Until Page Contains Element     xpath=//android.view.View[@content-desc="${end_date}"]
    Click Element                        xpath=//android.view.View[@content-desc="${end_date}"]
    Click Element                        id=android:id/button1

Click flight appPackage
    Click Element                        id=com.example.myapplication:id/radioButtonFlight

Click flight day
    [Arguments]                          ${day}=${false}
    Run Keyword If                       ${day}                     Click Element                        id=com.example.myapplication:id/checkBoxDay

Click book button on order page
    Click Element                        id=com.example.myapplication:id/book_flight
    Wait Until Page Contains Element     id=com.example.myapplication:id/textFromCity

Choose flight price
    Click Element                        id=com.example.myapplication:id/price5

Click confirm order
    Click Element                        id=com.example.myapplication:id/confirm_order

Verify book order is success
    Wait Until Page Contains Element     id=com.example.myapplication:id/checkedTextView