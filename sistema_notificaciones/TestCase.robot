*** Settings ***
Documentation    POC Controladores
Resource         login_generico.robot
Resource         op1_generar_notificaciones_demo.robot
Suite Setup      Configuracion entorno de ejecucion
Suite Teardown   Cerrar Browsers
Library          SeleniumLibrary
Force Tags       NewTag
*** Test Cases ***

[Test_001][step-01] Login generico
    [Tags]    DEBUG LOGIN
    Login generico      snreyess@achs.cl    Inicio03.
[Test_001][step-02] Click en notificaciones obligatorias
    Click notificaciones obligatorias
[Test_001][step-03] Ingresar paciente
    Ingresar paciente y buscar notificacion     16759571-5
[Test_001][step-04] Seleccionar del listado de notificaciones
    Ingresar estado notificacion                Iniciada
    Click en continuar notificacion
[Test_001][step-05] Indicar si aplica diagnostico
    #Seleccionar NT 142                          No cumple criterios
    Click en continuar
[Test_001][step-06] Formulario por diagnostico
    Click en boton grave
[Test_001][step-07] Envio exitoso de notificacion
    Click en boton enviar
[Test_001][step-08] Mensaje de confirmacion
    Validando Mensaje de confirmacion

#Crear notificacion Demo
#    [Tags]    DEBUG NOTIFICACIONES POC
#    Click en generar nueva notificacion     123
#Ingresar si aplica notificar diagnostico
#    Seleccionar Notificar Intoxicacion      No cumple criterios
#    Seleccionar NT 142                      No cumple criterios
#    Seleccionar Zoonosis                    No cumple criterios
#Ingresar si aplica notificar esguince cervical
#    Seleccionar Notificar Intoxicacion seccion2     No cumple criterios
#    Seleccionar NT 142 seccion2                     No cumple criterios


