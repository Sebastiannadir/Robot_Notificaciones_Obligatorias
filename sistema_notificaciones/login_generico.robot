*** Settings ***
Library         SeleniumLibrary     #plugins=SeleniumTestability;True;20 Seconds;True
#Suite Setup      Configuracion entorno de ejecucion
*** Variables ***
${URL}          https://wa-qa-sno.azurewebsites.net/
${BROWSER}      Chrome
#${userName}         snreyess@achs.cl
#${Password}         Inicio03.


*** Keywords ***


Configuracion entorno de ejecucion
    #Open Webdriver hosted on Azure Devops
    #Create Webdriver    ${BROWSER}    executable_path=C:/webdriver/chromedriver.exe
    Create Webdriver    ${BROWSER}    executable_path=D:/a/1/s/node_modules/chromedriver/lib/chromedriver/chromedriver.exe
    # Open Browser on Local Machine
    # Open Browser    https://www.autohero.com/de/search/    chrome
    #Maximize Browser Window
#comment
#comment2

    #Open Browser    ${URL}     ${BROWSER}
    GO TO   ${URL}
    Maximize Browser Window
    #Click Element   css=button.btn.btn-success
    Click Element   id=user-menu-dropdown
    Click Element   link=Iniciar Sesión

Cerrar Browsers
    Close All Browsers
Login generico
    [Arguments]      ${userName}      ${Password}
    Sleep    1
        #Wait For Testability Ready
        Input Text       name:loginfmt    ${userName}
        Click Element    id:idSIButton9
            Sleep  1
            #Wait For Testability Ready
                Input Text       name:passwd    ${Password}
                Click Element    id:idSIButton9
                    #Wait For Testability Ready
                    Click Element    id=idBtn_Back


