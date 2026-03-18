@echo off
REM Script para rodar a aplicação com variáveis de ambiente corretas

set PGPASSWORD=fb7z5flz
set DB_HOST=localhost
set DB_PORT=5432
set DB_NAME=obras_publicas
set DB_USER=postgres
set DB_PASSWORD=fb7z5flz

cd /d "%~dp0\app"
python main.py
