@echo off
title Actualizador de programas

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Actualizar-Programas-Winget.ps1"

pause