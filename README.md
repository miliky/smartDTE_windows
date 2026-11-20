# smartDTE para Windows

Facturación electrónica de El Salvador desde una PC: emisión y consulta de DTE, contactos, inventario, impresión, correo, compras, declaraciones y anexos.

**Versión de la aplicación: 4.1.4 · Entrega 4.1.4+support.1 · Windows de 64 bits**

[**Descargar la carpeta completa**](https://github.com/miliky/smartDTE_windows/archive/refs/heads/main.zip) · [**Manual ilustrado de instalación, configuración y uso**](Manual-smartDTE-Windows.pdf)

## Instalar

1. Descargue la carpeta completa mediante el enlace anterior o **Code → Download ZIP**.
2. Extraiga todos los archivos en una carpeta donde su usuario de Windows pueda escribir. Abra la carpeta extraída antes de ejecutar el programa.
3. Ejecute **smartDTE.exe**. Conserve junto a él la carpeta **_internal** y **Diagnosticar.cmd**. El ejecutable incluye sus dependencias; no necesita instalar Python.
4. En el primer inicio, cree el usuario inicial y configure empresa, ambiente, establecimiento y punto de venta.
5. Complete la licencia del NRC, los permisos del usuario, el servicio firmador y las credenciales de MH correspondientes al ambiente. Revise primero su configuración en **00 · Pruebas**.

Use siempre la misma carpeta de trabajo. Al crear un acceso directo, indique esa carpeta en **Iniciar en**. La app guarda la configuración y la base SQLite bajo **Documentos**; también permite utilizar PostgreSQL según la configuración de la instalación.

## Actualizar una instalación

1. Finalice operaciones y cierre todas las instancias que utilicen la misma base.
2. Respalde la carpeta **Documentos**, las carpetas externas de respaldo configuradas y, si utiliza PostgreSQL, su base del servidor.
3. Conserve una copia del ejecutable y de **_internal** anteriores. Sustituya juntos **smartDTE.exe**, **_internal** y **Diagnosticar.cmd** por los archivos de esta entrega.
4. Mantenga su carpeta **Documentos** existente. Abra la app desde su ubicación habitual y compruebe empresa, PV, licencia y documentos.

Descargar o actualizar los archivos del programa no requiere publicar su configuración, base, certificados ni licencias de cliente. Si usa Git dentro de una instalación de trabajo, revise los cambios antes de guardarlos. El `.gitignore` excluye datos locales nuevos y permite seguir las dependencias del programa; no elimina ni modifica archivos de la instalación.

## Funciones

- Facturación con receptor, productos, pagos, descuentos, retenciones y observaciones.
- Firma y transmisión mediante los servicios configurados; consulta y conservación de respuestas y sellos de MH.
- **Documentos → Consulta → Crear nuevo DTE** desde un único documento propio de tipo factura **01**, crédito fiscal **03**, sujeto excluido **14** o exportación **11**. Abre otro del mismo tipo para revisar; conserva el original y genera nuevos datos de emisión. En producción **01**, el original debe ser de producción; en pruebas **00**, admite originales de ambos ambientes.
- Inventario, contactos e importación revisable de líneas Excel/CSV.
- Historial, importación de DTE de compras, adjuntos de Outlook, compras físicas y constancias ISR.
- PDF carta, tickets, declaraciones, libros, anexos y ventas por períodos.
- Administración de empresas, puntos de venta, usuarios, permisos, licencias y ayuda sin conexión.

Los permisos de cada tipo de DTE controlan su emisión. **AdminDocDtes**, habilitado en usuario y licencia, permite la administración documental y los reportes correspondientes. El correo por Outlook requiere una instalación compatible con automatización COM.

Desde **Inicio → Punto de venta**, los administradores pueden cambiar el punto de venta de su sesión.

## Contactos

- Al guardar un contacto, la aplicación revisa NRC, NIT, DUI y los demás documentos de identificación dentro de la empresa. Si detecta un documento repetido o incompatible, muestra el conflicto. Si solo coincide el nombre, avisa y permite registrar un homónimo.
- Durante la importación y la facturación, una ficha con identificación compatible se completa con los datos que le faltan. La importación conserva el contenido del DTE original.
- Para unir dos fichas, selecciónelas en **Contactos** y pulse **Consolidar selección**. Elija cuál conservar, revise los datos que se agregarán y confirme. Si hay dos valores distintos para un campo de contacto, prevalece el de la ficha elegida. Los documentos de identificación en conflicto impiden consolidar.
- Desde la versión 4.1.4, la aplicación reemplaza las comas del correo por puntos tanto antes como después de la arroba, siempre que el resultado sea una dirección válida. El teléfono se guarda con al menos ocho dígitos. El correo y el teléfono del receptor se comprueban antes de firmar un DTE nuevo.

## Adjuntos del correo

1. Abra **Adjuntos del correo** y revise el nombre de la carpeta de Outlook. Si queda vacío se utiliza la bandeja de entrada predeterminada.
2. Elija **Por fechas** para utilizar Desde y Hasta, ambos incluidos, o **Descargar todos** para revisar todos los correos de esa carpeta, incluidos los históricos.
3. Pulse **Descargar e importar**. En el modo completo los calendarios y atajos de fecha quedan deshabilitados; al volver a Por fechas se conserva el rango capturado.
4. Revise los archivos y **resultado.txt** en la carpeta local de descarga. Se conservan los adjuntos de todas las empresas; la importación aplica los permisos y las reglas de la empresa activa.

La elección se realiza para esa operación. Cancelar no inicia una descarga ni cambia las preferencias guardadas.

## Manual y comprobación

El manual ilustrado corresponde a la edición **4.1.0**. Para los cambios posteriores, consulte **Contactos**, **Adjuntos del correo** y **Asistencia visual** en esta página. [Manual ilustrado](Manual-smartDTE-Windows.pdf)

Desde PowerShell, en la carpeta de la aplicación:

```powershell
.\smartDTE.exe --verificar-instalacion
```

Esta comprobación revisa dependencias y recursos sin abrir la base del usuario. **Diagnosticar.cmd** conserva el registro de un error de inicio en `%TEMP%\smartDTE-diagnostico.log`; revise su contenido antes de compartirlo.

Los datos de la comprobación de esta entrega y la huella del EXE se registran en [VERIFICACION.json](VERIFICACION.json).

Las huellas de los archivos distribuidos se encuentran en **SHA256SUMS.txt**. Si Windows bloquea un archivo, comunique al soporte la detección y la huella del archivo para su revisión.

## Asistencia visual

Con smartDTE abierto y la sesión iniciada, pulse **Solicitar asistencia** en la cabecera. Comparta el código temporal con el técnico que atiende su caso. Cuando aparezca su identidad, elija la ventana y pulse **Autorizar y compartir**.

La asistencia es de solo lectura y comparte una ventana por sesión. Puede elegir la ventana principal, Configuración, Licencias o el visor de un DTE. En el visor puede revisar **Respuesta de MH** y elegir **JSON completo** cuando necesite mostrar el documento. Para mostrar otra ventana, finalice la sesión y solicite un código nuevo.

Pulse **Finalizar asistencia** en la cabecera o **Finalizar** en la ventana auxiliar para detener la transmisión.

## Soporte

- Sitio: [smart.dte.company](https://smart.dte.company/).
- Oficina y tutoriales: **+503 7858 6614**, **smart-dte@outlook.com**, de 8:00 a 16:00.
- Soporte extendido: **+503 7867 4352**, **jefm@outlook.com**, de 8:00 a 22:00.
- Lunes a sábado, hora de El Salvador; sin atención los domingos.

Este repositorio contiene la distribución de **Windows**. La app Android tiene su [repositorio independiente](https://github.com/miliky/smartDTE_android).
