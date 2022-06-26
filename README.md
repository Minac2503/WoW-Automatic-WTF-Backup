# World of Warcraft, Automatic WTF Backup
#### Automatically backs up World of Warcraft's WTF folder.
Requires: [7-Zip](https://www.7-zip.org)

Place "\_retail\_WTF-auto-backup.bat" in the same folder as "\_retail\_".
Run the script as administrator to allow usage of the Task Scheduler application.
(You do not have to run the script more than once, unless you wish to manually take a backup.)

The script will pack your WTF folder into a .zip file located in "/World Of Warcraft/\_retail\_/WTF-Backups/".
If this folder does not exist, it will be created.

After the backup is completed, the script will check with your **Task Scheduler** if a task of the name "***World of Warcraft Automatic WTF Backup***" exists.
If not, it will create a new task by that name.
This task is set to run every Tuesday and Saturday at 02:00 (AM).
You can edit/remove this task, by pressing the Windows key, searching for "Task Scheduler", going under "Task Scheduler Library", and finding the Task by the name above.

If your computer is not on at 02:00, you can always change it to backup every time you log on.
Do note that doing this multiple times a day will overwrite any backups taken on that day.

## NOTE
You have to change the backup part of the script, to the location of your 7-zip.
```batch
REM Backup WTF folder
"X:\Programs\7-Zip\7z.exe" a -t7z "%backuplocation%\WTF_%DATE%.zip" "%backuppath%"
```
(Line 24)
