# currency_converter

**High-Level Solution**

Para la arquitectura, usaré MVVM - Clean, ya que hace sentido por el tamaño de la aplicación.

Entre las ventajas que tiene MVVM - Clean:

- Escalable debido a que el viewmodel depende de UseCase que fácilmente pueden incrementar.
- Testeable: Al ser todo modularizado, todos los componentes se pueden testear de manera única (Unit Test) y de manera integrada (Integration Test)
- Fácil de mantener, ya que la lógica de negocio está separada de la vista y el network layer.
- Una de las reglas que se deben de seguir es hacer que la regla de inyección de dependencias se cumpla como en el diagrama. En otras palabras, la capa de Dominio no debe tener ningún import de UIKi
- Uso de principios SOLID
![high_level_solution](https://github.com/mikeshep/currency_converter/assets/5679044/d5f26314-68f2-4b5b-9796-0fff33918184)


**Presentation Layer**

La capa de presentación, contiene toda la UI, que son coordinados por el Coordinator y ViewModel. El ViewModel puede ejecutar uno o múltiples UseCases's. La capa de Presentación depende enteramente de la capa de Dominio

**Domain Layer**

En esta capa la parte más importante es que no debe contener dependencias con otras capas. Esta contiene todas las Entidades, UsesCases y Repositorios.

**Data Layer**

La capa de Datos implementa los repositorios, en este caso, serían los Servicios.

Los Servicios son responsables de coordinar los datos entre las diferentes fuentes de datos: Backend o Bases de datos

La capa de Datos depende enteramente de la capa de Dominio
