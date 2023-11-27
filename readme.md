# Infraesctructura como código

Para el siguiente trabajo, se hizo un código en terraform donde se montó una infraestructura en GCP con terraform, también usando Ansible se creo un flujo para poner el sistema en fucionamiento

```
/
|-- terraform/
|   |-- main.tf
|   |-- variables.tf
|   |-- ...
|-- ansible/
|   |-- playbook.yml
|   |-- inventory.ini
|   |-- ...
|-- README.md
|-- ...


```

* **terraform:** Contiene los archivos de configuración de Terraform para la infraestructura en GCP.
* **ansible:** Incluye los archivos de configuración de Ansible para el flujo de puesta en funcionamiento del sistema.
* **README.md:** Documentación del proyecto.

# CD

Despliegue Continuo con Imagen Docker

Este proyecto sigue un enfoque de desarrollo continuo, donde se ha implementado un flujo de CI/CD para publicar una imagen de Docker lista para su uso. Es importante destacar que la imagen requiere la provisión de archivos `.env` para su ejecución.

Descripción del Flujo

1. **CI (Integración Continua):** Se ha configurado un sistema de integración continua que, tras cada cambio en el repositorio, automatiza la construcción y publicación de la imagen Docker. Esto garantiza que siempre se cuente con una versión actualizada y lista para su implementación.
2. **Imagen Docker:** La imagen Docker generada durante el proceso de CI contiene los componentes necesarios para ejecutar la aplicación. Sin embargo, es crucial proporcionar los archivos de configuración `.env` para que la imagen funcione correctamente.
3. **Despliegue Manual:** Aunque la construcción y publicación son automáticas, el despliegue no lo es. Se opta por un enfoque manual para garantizar una revisión cuidadosa antes de implementar cambios en un entorno productivo. Esto sigue los estándares de mantener una alta calidad en el software y evitar despliegues automáticos no deseados.
   Este enfoque manual es especialmente crítico en entornos financieros (fintech) donde se maneja información delicada. La revisión manual ayuda a garantizar la seguridad y la integridad de los datos, alineándose con los estándares regulatorios y de seguridad específicos de la industria.
4. **Despliegue de Infraestructura con Terraform:** Utilice Terraform para desplegar la infraestructura en Google Cloud Platform (GCP). Los archivos de configuración de Terraform se encuentran en el directorio `terraform/`. Asegúrese de configurar las variables en `terraform/variables.tf` según sus requisitos antes de ejecutar los siguientes comandos:

```
terraform init
terraform apply
```

5. **Despliegue del Proyecto con Ansible:** Una vez que la infraestructura esté en funcionamiento, utilice Ansible para configurar y poner en marcha el proyecto. Los archivos de configuración de Ansible se encuentran en el directorio `ansible/`.

   * Configurar las variables en `ansible/inventory.ini` y cualquier otro archivo necesario.
   * Ejecutar Ansible para poner en funcionamiento el sistema:

     ```
     cd ../ansible
     ansible-playbook -i inventory.ini docker_playbook.yml
     ```

   Es importante destacar que, debido al alcance del proyecto, no se consideró necesario utilizar máquinas grandes. Además, dentro de las configuraciones de Ansible, se realiza manualmente la configuración del host, tomando como bastión la propia computadora del usuario. En un entorno de producción, se recomienda utilizar un bastión con las direcciones IP privadas de todas las máquinas. Importante que desde la carpeta ansible se encuentre el archivo `.env`

   En Ansible ya está configurado en descargar la ultima imagen de docker [99072010120/tenpo](https://hub.docker.com/repository/docker/99072010120/tenpo/general), que es la imagen de repositorio.

   ## Runbook: Despliegue de Infraestructura en GCP con Terraform y Ansible:


   1. **Preparación del Entorno:**
      * Dirígete a la máquina donde se encuentra instalado Terraform y Ansible.
   2. **Despliegue de Nueva Infraestructura en GCP:**
      * Utiliza Terraform para ajustar la infraestructura, agregando más GPU y recursos de cómputo según sea necesario.
   3. **Actualización de IPs en Ansible:**
      * Si estás utilizando una red privada (VPC), actualiza las direcciones IP en Ansible. Asigna las direcciones IP privadas de los servicios.
   4. **Ejecución de Ansible en la Infraestructura:**
      * Utiliza Ansible para implementar las configuraciones y actualizaciones necesarias en la infraestructura. **Pruebas del Modelo:**

   ### **Rollback:**

   1. Realiza pruebas en el modelo para asegurarte de que funcione correctamente en la nueva infraestructura.
   2. **Volver a un Commit Anterior en Git:**

      * Utiliza Git para volver a un commit anterior que refleje la última versión estable de la infraestructura. Puedes hacer esto mediante el comando `git checkout` seguido del hash del commit al que deseas volver.
   3. Utiliza Git para volver a un commit anterior que refleje la última versión estable de la infraestructura. Puedes hacer esto mediante el comando `git checkout` seguido del hash del commit al que deseas volver.
   4. **Aplicar la Infraestructura desde la Versión Anterior:**

      * Utiliza Terraform para aplicar la configuración de infraestructura desde la versión específica del código. Esto puede implicar ejecutar comandos como `terraform apply` después de retroceder en Git.
   5. Utiliza Terraform para aplicar la configuración de infraestructura desde la versión específica del código. Esto puede implicar ejecutar comandos como `terraform apply` después de retroceder en Git.
   6. **Validación Post-Rollback:**

      * Realiza pruebas y validaciones para asegurarte de que la infraestructura se haya restaurado correctamente y que la aplicación esté en un estado funcional. Esto puede incluir pruebas manuales y/o automatizadas.
   7. Realiza pruebas y validaciones para asegurarte de que la infraestructura se haya restaurado correctamente y que la aplicación esté en un estado funcional. Esto puede incluir pruebas manuales y/o automatizadas.
   8. **Notificar del Incidente:**

      * Notifica al equipo relevante sobre el rollback y los problemas encontrados durante la implementación. Proporciona detalles sobre la causa del rollback, las acciones tomadas y cualquier impacto en el sistema.
      * Puedes utilizar herramientas de comunicación interna o un sistema de gestión de incidentes para asegurarte de que todos los miembros del equipo estén informados.
   9. Notifica al equipo relevante sobre el rollback y los problemas encontrados durante la implementación. Proporciona detalles sobre la causa del rollback, las acciones tomadas y cualquier impacto en el sistema.
   10. Puedes utilizar herramientas de comunicación interna o un sistema de gestión de incidentes para asegurarte de que todos los miembros del equipo estén informados.
   11. **Análisis Post-Rollback:**

       * Realiza un análisis post-rollback para comprender las razones detrás del problema durante la implementación. Esto puede ayudar a prevenir problemas similares en el futuro y mejorar los procesos de despliegue.
   12. Realiza un análisis post-rollback para comprender las razones detrás del problema durante la implementación. Esto puede ayudar a prevenir problemas similares en el futuro y mejorar los procesos de despliegue.

       ## Uso de este servidor

       *Optimización del Uso de Terraform y Ansible con un Servidor Bastión**


       1. **Servidor Bastión:**
          * Configurar un servidor bastión en la misma red que albergará Terraform.
          * Instalar Terraform en el servidor bastión para centralizar el servicio de despliegue desde este punto.
       2. **Conexión Segura:**
          * Utilizar una única clave `.pem` para conexiones seguras desde el servidor bastión.
          * Restringir el acceso a través de medidas de seguridad como firewalls y configuraciones de red.
       3. **Repositorios Privados:**
          * Establecer un repositorio privado para almacenar los scripts de Terraform y Ansible.
          * Separar el repositorio para el seguimiento específico de la infraestructura, facilitando la gestión y el versionado.
       4. **Uso de Terraform:**
          * Desarrollar scripts de Terraform para la definición de la infraestructura, optimizando recursos y asegurando la consistencia.
          * Utilizar módulos de Terraform para modularizar y reutilizar código.
          * Integrar variables y secretos de forma segura en el despliegue.
       5. **Uso de Ansible:**
          * Configurar Ansible para realizar tareas de aprovisionamiento en servidores.
          * Agregar pruebas de integración en Ansible para verificar la correcta configuración y despliegue de servicios.
          * Incluir test específicos para validar la estructura de salida del modelo y su comportamiento con el código desplegado.
       6. **Traqueo de la Infraestructura:**
          * Utilizar herramientas de seguimiento como Terraform Cloud o cualquier solución de seguimiento preferida para el repositorio de Terraform.
          * Integrar informes de estado de la infraestructura directamente en flujos de trabajo de CI/CD para mantener un monitoreo constante.
       7. **Gestión de Secretos:**
          * Utilizar herramientas de gestión de secretos, como Vault, para manejar información sensible de manera segura y distribuida.
       8. **Documentación Clara:**
          * Mantener una documentación clara y detallada de los scripts de Terraform y Ansible para facilitar futuras implementaciones y colaboración.
