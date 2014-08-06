FolderDateFix
=============

This is a Windows PowerShell script that allows you to specify a folder and perform a recursive scan of the folder and set the modification date of each folder to the modification date ofthe most recenlty modified file contained within that folder or subfolder.

Your execution policy in PowerShell will need to be set to at least RemoteSigned to allow you to run the scrip. The line below does this. 
>Set-ExecutionPolicy RemoteSigned

You can read more about execution policy at the link below.
http://technet.microsoft.com/en-us/library/ee176949.aspx

The script provides a GUI for selecting the folder and provides a progress bar of the processing. The progress bar starts a little jerky because the progress bar is displayed prior to doing a recursive scan to count the folders. The count can take a few seconds but without the progress bar the user would have no indicate that the script was processing. Once the folders are counted, the progress bar updates at the folder are processed. 

The script was developed in PowerShell v1.0 in Windows 7 Pro. This script was developed after a glitch with DropBox caused all of my folder modification dates to be updated to the then current date. I like to view my project's folder by date so my most recent projects are on top and the oldest are at the bottom. A quick glance let's me see where I have been spending my time and which projects may be lanugishing. 

This was my first exposure to PowerShell. I used Google to search for examples of functional elements as I built the script. I did not keep track of what came from where because I was not certain that I would get the script to work, let alone want to share the script. I found several ways to impliment almost every function and tried to always use the most simple to understand approach. 
