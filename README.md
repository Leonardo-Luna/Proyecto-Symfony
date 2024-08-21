Problemas de los que estoy al tanto:

No pude solucionar:
  - Conexión con Mailpit.
  - Error al publicar un comentario. El envío por mail/slack no reconoce la ruta "review_comment" (existe y funciona). Se guarda en la base de datos correctamente en el estado esperado.
  - No reconoce los siguientes métodos:
    - htmlTemplate() (CommentReviewNotification:29)
    - getAdminRecipients() (CommentMessageHandler:54)
    Ambos parecen ser correctos y están en la documentación. Chat-GPT y Copilot no ayudaron.

A revisar:
  - No se puede acceder a la base de datos "proyecto_test".

<a href="https://symfony.com/doc/6.4/the-fast-track/en/index.html">Enlace al libro</a>
