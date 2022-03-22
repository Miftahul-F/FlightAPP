*** Settings ***
Documentation           Header test cases
Library                 AppiumLibrary

*** Keywords ***
Click search button
    Click search button on home page

Click search button on home page
    Click Element                        id=com.example.myapplication:id/search_flight
    Wait Until Page Contains Element     id=com.example.myapplication:id/enterFlight

Click book button
    Click book button on home page

Click book button on home page
    Click Element                        id=com.example.myapplication:id/book
    Wait Until Page Contains Element     id=com.example.myapplication:id/textView3