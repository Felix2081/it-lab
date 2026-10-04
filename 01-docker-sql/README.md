# Docker
# SQL Server in Docker

## Ziel
SQL Server 2022 im Container betreiben, Datenbank aufbauen, Backup und Restore testen.

## Vorgehen
- Docker Compose mit SQL Server, Passwort über .env (nicht im Repo)
- Verbindung über VS Code (mssql)
- Übungsdatenbank mit Kunden und Rechnungen, Fremdschlüssel, JOIN-Auswertung
- Backup, Löschen, Restore

## Gelernt
- Unterschied Container und Volume
- Fehlermeldungen lesen (Msg 547: Fremdschlüssel, leeres Passwort durch fehlende .env)
- LEFT JOIN vs. JOIN