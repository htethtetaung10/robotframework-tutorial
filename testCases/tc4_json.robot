*** Settings ***
Library JSONLibrary
Library os 
Library Collections

*** Test Cases ***
Testcase1:
    ${json_obj}=    load json from file    C:\Users\enathue\projects\apiautomation\testCases\data\jsondata.json

    ${name_value} = get value from json     ${json_obj} $.firstName
    should be equal ${name_value[0]}    John

    ${street_value}=    get value from json   ${json_obj}     $.address.streetAddress
    should be equal     ${street_value[0]}  naist street