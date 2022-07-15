*** Settings ***
Library RequestsLibrary
Library Collections

*** Variables ***
${base_url}= http://restapi.demoqa.com/customer

*** Test Cases ***
    create session mysession ${base_url}
    ${body}= create dictionary FirstName=Yoon LastName=Cherry UserName=yooncherry Password=yooncherry Email=yooncherry@gmail.com
    ${header}= create dictionary Content-Type=application/json
    ${response}= post request mysession /register data=${body} headers=${header}

    log to console ${response.status_code}
    log to console ${response.content}

    #VALIDATIONS
    ${res_body}= convert to string ${response.content}
    should be equal ${status_code} 201

    ${res_body}= convert to string ${response.content}
    should contain ${res_body} OPERATION_SUCCESS
    should contain ${res_body} Operation compeleted succesfully

    
