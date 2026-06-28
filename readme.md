# Winget Easy Updater

![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-5391FE)
![License](https://img.shields.io/badge/License-MIT-green)

🇪🇸 Español | 🇬🇧 English

---

# 🇪🇸 Español

## ¿Qué es?

Winget Easy Updater es una utilidad desarrollada en PowerShell para facilitar la actualización del software instalado en Windows utilizando **Winget**, el gestor de paquetes oficial de Microsoft.

El objetivo es que cualquier usuario, incluso con conocimientos básicos de informática, pueda mantener actualizado su equipo mediante una interfaz sencilla basada en consola.

## Características

- ✔ Detecta automáticamente las aplicaciones con actualizaciones disponibles.
- ✔ Muestra una lista numerada de programas.
- ✔ Permite actualizar:
  - Todos los programas.
  - Solo los programas seleccionados.
  - Ningún programa (cancelar).
- ✔ Solicita permisos de administrador automáticamente cuando son necesarios.
- ✔ No requiere conocimientos de Winget.
- ✔ No instala software adicional.

## Requisitos

- Windows 10 o Windows 11
- Winget instalado (App Installer)
- PowerShell 5.1 o superior

## Instalación

Clonar el repositorio:

```bash
git clone https://github.com/jrodg85/Winget-Easy-Updater.git
```

o descargar el ZIP desde GitHub.

## Uso

Ejecutar:

```
Actualizar programas.bat
```

El programa realizará automáticamente los siguientes pasos:

1. Buscar actualizaciones disponibles.
2. Mostrar los programas encontrados.
3. Permitir elegir:
   - Actualizar todos.
   - Actualizar solo algunos.
   - Cancelar.
4. Iniciar el proceso de actualización.

## ¿Por qué este proyecto?

Aunque Winget es una herramienta excelente, muchos usuarios no están familiarizados con la consola de Windows.

Este proyecto pretende acercar Winget a cualquier usuario mediante un proceso mucho más sencillo e intuitivo.

## Próximas mejoras

- Interfaz gráfica (Windows Forms o WPF).
- Barra de progreso.
- Registro de actualizaciones.
- Actualización automática mediante tareas programadas.
- Soporte multilenguaje.
- Exportación de informes.

## Licencia

MIT License.

---

# 🇬🇧 English

## What is it?

Winget Easy Updater is a PowerShell utility that simplifies updating installed Windows applications using **Winget**, Microsoft's official package manager.

The goal is to provide an easy solution for users with little or no technical knowledge.

## Features

- ✔ Automatically detects available software updates.
- ✔ Displays a numbered list of applications.
- ✔ Allows the user to:
  - Update all applications.
  - Update selected applications.
  - Cancel the operation.
- ✔ Automatically requests Administrator privileges when required.
- ✔ No Winget knowledge required.
- ✔ No additional software installation.

## Requirements

- Windows 10 or Windows 11
- Winget installed (App Installer)
- PowerShell 5.1 or later

## Installation

Clone the repository:

```bash
git clone https://github.com/jrodg85/Winget-Easy-Updater.git
```

or download the ZIP package from GitHub.

## Usage

Run:

```
Update Programs.bat
```

The application will:

1. Search for available updates.
2. Display all detected applications.
3. Allow the user to:
   - Update all.
   - Update selected applications.
   - Cancel.
4. Start the update process.

## Why this project?

Winget is an excellent package manager, but many Windows users are not comfortable using the command line.

This project provides a simple and user-friendly way to keep Windows applications up to date.

## Roadmap

- Graphical User Interface (WinForms/WPF).
- Progress bar.
- Update log.
- Scheduled automatic updates.
- Multi-language support.
- Export update reports.

## License

MIT License.