*** Settings ***
Library         SeleniumLibrary     #plugins=SeleniumTestability;False;30 Seconds;True
*** Variables ***
${parent_id}           name=diagnosis-form-tabs-index
*** Keywords ***
Click notificaciones obligatorias
    Wait For Testability Ready
    Click Element   id=navbar-notifications
Click en generar nueva notificacion
    [Arguments]    ${idEpisodio}
    Wait For Testability Ready
        Click Element   xpath://button[@id='new-notify']/b
        Wait For Testability Ready
            Input Text     id=episodio      ${idEpisodio}
                Click Element   css=button.btn.btn-primary.btn-inverse > b
                Sleep   1
Ingresar paciente y buscar notificacion
    [Arguments]    ${RUT_Paciente}
        Input Text      id=grid-searchbox    ${RUT_Paciente}
        Click Element   css=div.suggestions-searchbox.tt-suggestion.tt-selectable
            Sleep   2
            Click Element   xpath=(//a[contains(@href, '#')])[6]
            Press Keys    None    ENTER
                Wait For Testability Ready
                Sleep   1
Ingresar estado notificacion
    [Arguments]     ${FilterNotification}
        Wait For Testability Ready
        Input Text      xpath=(//input[@type='search'])[2]     ${FilterNotification}
            Press Keys    None    ENTER
            Click Element   css=a.k-icon.k-i-expand
            Sleep   0.5
Click en continuar notificacion
    Wait For Testability Ready
        Click Element   xpath://th[8]/button

Seleccionar Notificar Intoxicacion
    [Arguments]     ${SelectReasonIntoxication}
    Wait For Testability Ready
        Click Element   xpath://label[2]
            Click Element   xpath://div[@id='1-razon-container']/span/span/span
            Input Text      css=input.select2-search__field     ${SelectReasonIntoxication}
            Press Keys    None    ENTER
            #Sleep   1
Seleccionar NT 142
    [Arguments]     ${SelectReasonNT142}
    Wait For Testability Ready
        Click Element   css=label.btn.btn-primary.btn-sm.toggle-on
            Click Element   css=span.select2-selection__placeholder
            Input Text      css=input.select2-search__field     ${SelectReasonNT142}
            Press Keys    None    ENTER
Click en continuar
    Wait For Testability Ready
        Click Element   xpath://button[@type='button']
        #Sleep       3
Click en boton grave
    Wait For Testability Ready
        Sleep   1
        Click Element   css=label.form-checkbox-help
Click en boton enviar
        Sleep   1
        Execute JavaScript      $("[id^=form-send]").click();
Validando Mensaje de confirmacion

        #@{LastFileLoaded}=  Get WebElements     //div[starts-with(@id,'diagnosis-alert-form')]/label
                    #Should Not Be Empty     ${LastFileLoaded}
                    #Element Should Contain    xpath://div[6]/div/div/div[2]/div/label     Formulario finalizado con éxito.
    Sleep   3

Seleccionar Zoonosis
    [Arguments]     ${SelectReasonZoonosis}
    #Wait For Testability Ready
        Click Element   xpath://div[3]/div[2]/div/div/label
            Click Element   xpath://div[@id='3-razon-container']/span/span/span
            Input Text      css=input.select2-search__field     ${SelectReasonZoonosis}
            Press Keys    None    ENTER
               # Sleep   1
Seleccionar Notificar Intoxicacion seccion2
    [Arguments]     ${SelectReasonIntoxication}
    Wait For Testability Ready
        Click Element       xpath://div[6]/div/div/div[2]/div/div/label
            Click Element   xpath://div[@id='4-razon-container']/span/span/span
            Input Text      css=input.select2-search__field    ${SelectReasonIntoxication}
            Press Keys    None    ENTER
Seleccionar NT 142 seccion2
    [Arguments]     ${SelectReasonNT142}
    Wait For Testability Ready
        Click Element   xpath://div[6]/div/div[2]/div[2]/div/div/label[2]
            Click Element   xpath://div[@id='5-razon-container']/span/span/span
            Input Text      css=input.select2-search__field    ${SelectReasonNT142}
            Press Keys    None    ENTER
Click boton continuar
     Wait For Testability Ready
        Click Element   xpath://div[6]/div/div[2]/div[2]/div/div/label[2]
    Sleep   10