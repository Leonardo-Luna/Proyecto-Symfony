Problemas de los que estoy al tanto:

No pude solucionar:
  - Conexión con Mailpit.
  - No reconoce los siguientes métodos:
    - htmlTemplate() (CommentReviewNotification:29)
    - getAdminRecipients() (CommentMessageHandler:54)
    Ambos parecen ser correctos y están en la documentación. Chat-GPT y Copilot no ayudaron.
  - El header solo se actualiza si se borra el cache manualmente (bin/console cache:clear).
  - La página de Hello API (/api) no se carga correctamente (La API funciona correctamente).

A revisar:
  - No se puede acceder a la base de datos "proyecto_test".

To-do:
  - Acomodar el CRUD de admin para que hashee las contraseñas cambiadas.

<a href="https://symfony.com/doc/6.4/the-fast-track/en/index.html">Enlace al libro</a>
