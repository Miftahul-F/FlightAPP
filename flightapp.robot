*** Settings ***
Documentation           Sign in test cases
Library                 AppiumLibrary
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
Login using valid username and password
    Click Login Button
    Wait Element Input Username and Password
    Input Username                  username=support@ngendigital.com
    Input Password                  password=abc123
    Click Sighin Button
    Verify Login Passed

Login using invalid username 
    Click Login Button
    Wait Element Input Username and Password
    Input Username                  username=support@digital.com
    Input Password                  password=abc123
    Click Sighin Button
    Verify Login Failed

*** Keywords ***
Open Flight Application
    Open Application                ${REMOTE_URL}	
    ...                             platformName=${PLATFORM_NAME}
    ...                             platformVersion=${PLATFORM_VERSION}
    ...                             deviceName=${DEVICE_NAME}
    ...                             appPackage=${APP_PACKAGE}
    ...                             appActivity=${APP_ACTIVITY}

Click Login Button
    Click Element                   id=com.example.myapplication:id/login

Input Username
    [Arguments]                     ${username}
    Input Text                      id=com.example.myapplication:id/username        ${username}

Input Password
    [Arguments]                     ${password}
    Input Text                      id=com.example.myapplication:id/password        ${password}

Click Sighin Button
    Click Element                   id=com.example.myapplication:id/signIn

Wait Element Input Username and Password
    Wait Until Element Is Visible   id=com.example.myapplication:id/username

Verify Login Passed
    Wait Until Page Contains Element   id=com.example.myapplication:id/textView

Verify Login Failed
    # Wait Until Page Contains                                                      Invalid username/password
    Page Should Contain Text                                                        Invalid username/password