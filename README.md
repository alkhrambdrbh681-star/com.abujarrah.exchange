# com.abujarrah.exchange
abu_jarrah_exchange/ ├── lib/ │   ├── main.dart │   ├── app.dart │   ├── routes/ │   ├── models/ │   ├── services/ │   ├── screens/ │   ├── widgets/ │   ├── providers/ │   └── utils/ ├── assets/ ├── android/ ├── ios/ └── pubspec.yaml
# Registro de una aplicación de GitHub

Puedes registrar un GitHub App en tu cuenta personal o en cualquier organización de la que seas propietario.

## Acerca del registro GitHub Apps

Puede registrar un GitHub App de varias maneras.

* En su **cuenta personal**.
* En una **organización de su propiedad**.
* En una **organización** que le haya concedido permiso para administrar todas sus aplicaciones. Consulte [Agregar y quitar administradores de aplicaciones de GitHub en tu organización](/es/organizations/managing-programmatic-access-to-your-organization/adding-and-removing-github-app-managers-in-your-organization).

un usuario u organización puede registrar hasta 100 GitHub Apps, pero no hay ningún límite para la cantidad de GitHub Apps que se pueden instalar en una cuenta.

## Registrar un GitHub App

1. En la esquina superior derecha de cualquier página, en GitHub, haz clic en la fotografía del perfil.

2. Navega a la configuración de tu cuenta.
   * Para una aplicación propiedad de una cuenta personal, haga clic en **Configuración**.
   * Para una aplicación propiedad de una organización:
     1. Haga clic en **Sus organizaciones**.
     2. A la derecha de la organización, haga clic en **Configuración**.

3. En la barra lateral de la izquierda, haz clic en **<svg version="1.1" width="16" height="16" viewBox="0 0 16 16" class="octicon octicon-code" aria-label="code" role="img"><path d="m11.28 3.22 4.25 4.25a.75.75 0 0 1 0 1.06l-4.25 4.25a.749.749 0 0 1-1.275-.326.749.749 0 0 1 .215-.734L13.94 8l-3.72-3.72a.749.749 0 0 1 .326-1.275.749.749 0 0 1 .734.215Zm-6.56 0a.751.751 0 0 1 1.042.018.751.751 0 0 1 .018 1.042L2.06 8l3.72 3.72a.749.749 0 0 1-.326 1.275.749.749 0 0 1-.734-.215L.47 8.53a.75.75 0 0 1 0-1.06Z"></path></svg> Developer settings**.

4. En la barra lateral de la izquierda, haga clic en **GitHub Apps** .

5. Haga clic en **Nuevo GitHub App**.

6. En "GitHub App name", escriba un nombre para la aplicación. Debe elegir un nombre claro y corto. El nombre no puede tener más de 34 caracteres. El nombre de la aplicación (convertido en minúsculas, con espacios reemplazados por `-` y con los caracteres especiales reemplazados) se mostrará en la interfaz de usuario cuando la aplicación realice una acción. Por ejemplo, `My APp Näme` se mostraría como `my-app-name`.

   El nombre debe ser único en GitHub. No puede usar el mismo nombre que una cuenta existente GitHub , a menos que sea su propio usuario o nombre de organización.

7. Opcionalmente, en "Descripción", escribe una descripción de la aplicación. Los usuarios verán esta descripción cuando instalen la aplicación.

8. En "URL de la página principal", escribe la URL completa para el sitio web de la aplicación. Si no tienes una dirección URL dedicada y el código de la aplicación se almacena en un repositorio público, puedes usar esa URL del repositorio. O bien puedes usar la dirección URL de la cuenta propietaria de la aplicación.

9. Opcionalmente, en "URL de devolución de llamada", escribe la URL completa a la cual se redirigirá a los usuarios después de que autoricen la instalación.

   Puedes escribir hasta 10 URL de devolución de llamada. Para agregar URL de devolución de llamada adicionales, haz clic en **Agregar URL de devolución de llamada**.

   Si la aplicación no necesita actuar en nombre de un usuario (no es necesario generar un token de acceso de usuario) este campo se omitirá. Si la aplicación usa el flujo de dispositivos en lugar del flujo de aplicación web para generar un token de acceso de usuario, este campo se omitirá.

   Para obtener más información sobre el URL de callback, consulta [Acerca de la dirección URL de devolución de llamada de autorización de usuario](/es/apps/creating-github-apps/registering-a-github-app/about-the-user-authorization-callback-url). Para más información sobre cómo generar un token de acceso de usuario para actuar en nombre de un usuario, consulta [Autenticación con una aplicación de GitHub en nombre de un usuario](/es/apps/creating-github-apps/authenticating-with-a-github-app/authenticating-with-a-github-app-on-behalf-of-a-user) y [Generación de un token de acceso de usuario para una aplicación de GitHub](/es/apps/creating-github-apps/authenticating-with-a-github-app/generating-a-user-access-token-for-a-github-app).

10. Opcionalmente, para evitar que los tokens de autorización de usuario expiren, desmarcar **Expirar tokens de autorización de usuario**.
    GitHub recomienda encarecidamente que deje seleccionada esta opción. Para más información sobre cómo actualizar los tokens expirados y las ventajas de los tokens de acceso de usuario que expiran, consulta [Actualización de tokens de acceso de usuario](/es/apps/creating-github-apps/authenticating-with-a-github-app/refreshing-user-access-tokens). Si la aplicación no necesita generar un token de acceso de usuario, este campo se omitirá.

11. Opcionalmente, para pedir a los usuarios que autoricen la aplicación cuando la instalen, selecciona **Solicitar autorización de usuario (OAuth) durante la instalación**. Si un usuario autoriza la aplicación, esta puede generar un token de acceso de usuario para realizar solicitudes de API en nombre del usuario y atribuir la actividad de la aplicación al usuario. Para más información, consulta [Autenticación con una aplicación de GitHub en nombre de un usuario](/es/apps/creating-github-apps/authenticating-with-a-github-app/authenticating-with-a-github-app-on-behalf-of-a-user) y [Generación de un token de acceso de usuario para una aplicación de GitHub](/es/apps/creating-github-apps/authenticating-with-a-github-app/generating-a-user-access-token-for-a-github-app).

12. Opcionalmente, si quieres usar el flujo de dispositivos para generar un token de acceso de usuario, selecciona **Habilitar flujo de dispositivos**. Para más información, consulta [Generación de un token de acceso de usuario para una aplicación de GitHub](/es/apps/creating-github-apps/authenticating-with-a-github-app/generating-a-user-access-token-for-a-github-app).

13. Opcionalmente, en "Dirección URL de instalación", escribe la URL a la que redirigir los usuarios después de instalar la aplicación. Si se necesita configuración adicional después de la instalación, puedes usar esta dirección URL para indicar a los usuarios qué pasos realizar después de la instalación. Para más información, consulta [Acerca de la URL de configuración](/es/apps/creating-github-apps/registering-a-github-app/about-the-setup-url).

    Si has seleccionado **Solicitar autorización de usuario (OAuth) durante la instalación** en un paso anterior, no podrás escribir una dirección URL aquí. En su lugar, a los usuarios se les redirigirá a la URL de devolución de llamada como parte del flujo de autorización, donde puedes describir la configuración adicional.

14. Opcionalmente, si quieres redirigir a los usuarios a la URL de configuración después de actualizar una instalación, selecciona **Redirigir al actualizar**. Una actualización incluye la adición o eliminación de un repositorio para una instalación. Si "URL de configuración" está en blanco, se omitirá.

15. Opcionalmente, si no quieres que la aplicación reciba eventos de webhook, desactiva **Activo**. Por ejemplo, si la aplicación solo se va a usar para la autenticación o no necesita responder a webhooks, anula la selección de esta opción. Para más información, consulta [Uso de webhooks con aplicaciones de GitHub](/es/apps/creating-github-apps/registering-a-github-app/using-webhooks-with-github-apps).

16. Si seleccionó **Activo** en el paso anterior, en "Dirección URL de webhook", escriba la dirección URL a la que GitHub se deben enviar eventos de webhook. Para más información, consulta [Uso de webhooks con aplicaciones de GitHub](/es/apps/creating-github-apps/registering-a-github-app/using-webhooks-with-github-apps).

17. Opcionalmente, si has seleccionado **Activo** en el paso anterior, en "Secreto de webhook", escribe un token secreto para proteger los webhooks.               GitHub recomienda encarecidamente que configures un secreto de webhook. Para más información, consulta [Uso de webhooks con aplicaciones de GitHub](/es/apps/creating-github-apps/registering-a-github-app/using-webhooks-with-github-apps).

18. Si has escrito una dirección URL de webhook, en "Comprobación SSL", selecciona si quieres habilitar la comprobación de SSL.
    GitHub recomienda encarecidamente habilitar la comprobación ssl.

19. En "Permisos", elige los permisos que necesite la aplicación. Para permiso, selecciona el menú desplegable y haz clic en **Solo lectura**, **Lectura y escritura**, o **Sin acceso**. Debes seleccionar los permisos mínimos necesarios para la aplicación. Para más información, consulta [Elección de permisos para una aplicación de GitHub](/es/apps/creating-github-apps/registering-a-github-app/choosing-permissions-for-a-github-app).

20. Si has seleccionado **Activo** en el paso anterior para indicar que la aplicación debe recibir eventos de webhook, en "Suscribirse a eventos", selecciona los eventos de webhook que quieras que la aplicación reciba. Los permisos que has seleccionado en el paso anterior determinan qué eventos de webhook están disponibles. Para más información sobre cada evento de webhook, consulta [Eventos y cargas de webhook](/es/webhooks/webhook-events-and-payloads).

21. En "¿Dónde se puede GitHub App instalar?", seleccione **Solo en esta cuenta** o **en Cualquier cuenta**. Para obtener más información sobre las opciones de instalación, consulte [Hacer que una aplicación de GitHub sea pública o privada](/es/apps/creating-github-apps/registering-a-github-app/making-a-github-app-public-or-private).

22. Haga clic en **Crear GitHub App**.

## Pasos siguientes

Después de registrar un GitHub App, querrás escribir código para hacer que tu GitHub App haga algo. Para ver ejemplos de cómo escribir código, consulta:

* [Inicio rápido para compilar aplicaciones de GitHub](/es/apps/creating-github-apps/writing-code-for-a-github-app/quickstart)
* [Creación de una aplicación de GitHub que responda a eventos de webhook](/es/apps/creating-github-apps/writing-code-for-a-github-app/building-a-github-app-that-responds-to-webhook-events)
* [Creación de un botón "Iniciar sesión con GitHub" con una aplicación GitHub](/es/apps/creating-github-apps/writing-code-for-a-github-app/building-a-login-with-github-button-with-a-github-app)
* [Creación de una CLI con una aplicación de GitHub](/es/apps/creating-github-apps/writing-code-for-a-github-app/building-a-cli-with-a-github-app)
* [Realización de solicitudes de API autenticadas con una aplicación de GitHub en un flujo de trabajo de Acciones de GitHub](/es/apps/creating-github-apps/authenticating-with-a-github-app/making-authenticated-api-requests-with-a-github-app-in-a-github-actions-workflow)

Debes intentar seguir los procedimientos recomendados. Para más información, consulta [Procedimientos recomendados para crear una aplicación de GitHub](/es/apps/creating-github-apps/about-creating-github-apps/best-practices-for-creating-a-github-app).

Una vez que tu GitHub App esté completamente configurado, podrás instalar tu GitHub App y compartir tu GitHub App con otras personas. Para más información, consulta [Instalación de su propia aplicación de GitHub](/es/apps/using-github-apps/installing-your-own-github-app) y [Compartir tu aplicación de GitHub](/es/apps/sharing-github-apps/sharing-your-github-app).

Siempre puedes modificar la configuración de tu GitHub App. Para más información, consulta [Modificación de un registro de aplicación de GitHub](/es/apps/maintaining-github-apps/modifying-a-github-app-registration).
