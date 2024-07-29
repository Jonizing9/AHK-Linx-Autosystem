#Persistent
#NoEnv
SetBatchLines, -1
SetTitleMatchMode, 2
DetectHiddenWindows, On

; Path configurations
desktopPath := A_Desktop
destinationPath := "C:\Python27"
pythonExe := "C:\Python27\python.exe"
pythonScript := destinationPath . "\pega_senha_multiplos.py"
senhasFile := destinationPath . "\senhas.txt"
processName := "LMIRTechConsole.exe"

; Function to check if the process is running
IsProcessRunning(processName)
{
    Process, Exist, %processName%
    return (ErrorLevel != 0)
}

; Function to handle new files
ProcessNewFiles()
{
    global desktopPath, destinationPath, pythonExe, pythonScript, senhasFile

    Loop, Files, %desktopPath%\config*.db
    {
        ; Determine the new file name
        newFileName := "config.db"

        ; Rename the file to config.db if it's not already named that
        if (A_LoopFileName != newFileName)
        {
            FileMove, %A_LoopFileFullPath%, %desktopPath%\%newFileName%, 1
        }

        ; Move the renamed file to the destinationPath
        FileMove, %desktopPath%\%newFileName%, %destinationPath%\%newFileName%, 1

        ; Check if senhas.txt exists and overwrite or create it
        if FileExist(senhasFile)
        {
            FileDelete, %senhasFile%
        }
        FileAppend,, %senhasFile%

        ; Run the Python script
        RunWait, %pythonExe% "%pythonScript%", , Hide

        ; Check if there were any errors running the script
        if (ErrorLevel != 0)
        {
            MsgBox, 16, Error, Failed to run Python script. Error code: %ErrorLevel%.
        }
        else
        {
            ; Open the senhas.txt file
            Run, %senhasFile%
        }
    }
}

; Set up a timer to check every 5 seconds
SetTimer, CheckForNewFiles, 5000

CheckForNewFiles:
    ; Check if the process is running
    if (IsProcessRunning(processName))
    {
        ProcessNewFiles()
    }
Return
