*** Settings ***
Documentation           Login test cases
Library                 AppiumLibrary

*** Keywords ***
Login with valid username and password
    Click Login Button
    Wait Element Input Username and Password
    Input Username                  username=support@ngendigital.com
    Input Password                  password=abc123
    Click Sighin Button
    Verify Login Passed

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