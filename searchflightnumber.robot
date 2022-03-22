*** Settings ***
Documentation           Search test cases
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
User Should be able to search a flight
    Login with valid username and password 
    Click search button
    Input flight number                  flight_number=DA935
    Click search button on search page
    Verify flight number is correct      verify=DA 935

*** Keywords ***
Open Flight Application
    Open Application                ${REMOTE_URL}	
    ...                             platformName=${PLATFORM_NAME}
    ...                             platformVersion=${PLATFORM_VERSION}
    ...                             deviceName=${DEVICE_NAME}
    ...                             appPackage=${APP_PACKAGE}
    ...                             appActivity=${APP_ACTIVITY}

Input flight number
    [Arguments]                          ${flight_number}
    Input Text                           id=com.example.myapplication:id/flight_number        ${flight_number}

Click search button on search page
    Click Element                        id=com.example.myapplication:id/searchFlight

Verify flight number is correct
    [Arguments]                          ${verify}
    Wait Until Page Contains Element     xpath=//*[@text="${verify}"] 

