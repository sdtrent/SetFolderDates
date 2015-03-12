@@ -0,0 +1,41 @@
#Change Folder Modification Dates to reflect the date of the newest file contained in each folder and sub-folders.
#To use this you must first run powershell.exe as admin and update the Execution Policy using the command below.
#> Set-ExecutionPolicy RemoteSigned
#Confirm that you want to make the change when promoted
#You can then run the script from the Windows PowerShell ISE
#Shane Trent, shanedtrent@gmail.com, fettricks.blogspot.com

Clear  #clear console text
$FolderNav = New-Object -com Shell.Application  # Create application object to be used to display navigation box
$BrowseFolderOptions = 513  #Options, &h200 (512, no New Folder Button) + &h1 (1, File system directories only)
$folder = $FolderNav.BrowseForFolder(0, "Select Folder for processing.", $BrowseFolderOptions, "") #Display nav box and get folder to process
if ($folder.Self.Path) #Proceed only if a folder was selected, exit if cancelled
  { 
  $ConfirmPath=[System.Windows.Forms.MessageBox]::Show($folder.Self.Path,"Confirm Folder to be processed.",[System.Windows.Forms.MessageBoxButtons]::OKCancel)
  switch ($ConfirmPath)    #Have the user to confirm the path to the folder to be processed
    {
    "OK" 
      { 
      Write-Host "Folder Path Selected - " $folder.Self.Path    #Print the selected folder to the console
      Set-Location $folder.Self.Path                            #Set the path to the folder to be processed
      Write-Progress -Activity "Scanning Folder.."  -Status "Please wait."     #Show static status bar before scanning the folder tree
      $FolderArray = Get-ChildItem -recurse | Where-Object {$_.PsIsContainer}  #Scan tree to generate an array of all folders
      for ($i=0; $i -lt $FolderArray.count; $i++)    #Process each folder
        { 
        $NewestFile = ($FolderArray[$i] | Get-ChildItem -recurse | Where-Object  {!$_.PsIsContainer} | Sort-Object LastWriteTime | Select-Object -last 1) # Find newest file in the tree
        if ($NewestFile) {$FolderArray[$i].LastWriteTime = $NewestFile.LastWriteTime}               #If there is a file, update the folder date
        $d = [decimal]::round(($i /$FolderArray.count) * 100)                       #Calculate the percentage of folders processed for bar and status text
        Write-Progress -Activity "Processing.." -PercentComplete $d -CurrentOperation "$d% complete" -Status "Please wait."  #Update progress bar
        } 
      Write-Host "Processing Completed." "Processed" ($FolderArray.count) "folders!"  #We are done, write stats to console
      Write-Progress "Done" "Done" -completed                                         #Close the progress bar
      $message = ($FolderArray.count) , " Folders were processed."                    #Build message for final message box
      [System.Windows.Forms.MessageBox]::Show($message , "Processing Completed!")     #Display message box with number of folders processed
      }
    "Cancel" 
       {
       Write-Host "You cancelled the selected folder path"  #We land here if the user cancelled the path confirmation message box                                      
       }
     }
   }
else {Write-Host "You cancelled the folder selection."}     #And we land here if the user cancelled the folder navigation box
