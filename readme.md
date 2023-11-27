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

## CD

Despliegue Continuo con Imagen Docker

Este proyecto sigue un enfoque de desarrollo continuo, donde se ha implementado un flujo de CI/CD para publicar una imagen de Docker lista para su uso. Es importante destacar que la imagen requiere la provisión de archivos `.env` para su ejecución.

## Descripción del Flujo

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

   En Ansible ya está configurado en descargar la ultima imagen de docker [99072010120/tenpo](https://hub.docker.com/repository/docker/99072010120/tenpo/general), que es la imagen de repositorio
