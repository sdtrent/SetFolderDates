FolderDateFix
=============

This is a Windows PowerShell script that allows you to specify a folder and perform a recursive scan of the folder and set the modification date of each folder to the modification date of the most recently modified file contained within that folder or sub-folder.

Your execution policy in PowerShell will need to be set to at least RemoteSigned to allow you to run the scrip. The line below does this. 
>Set-ExecutionPolicy RemoteSigned

You can read more about execution policy at the link below.

http://technet.microsoft.com/en-us/library/ee176949.aspx

The script provides a windows prompt for selecting the target folder and provides a progress bar of the processing. The script uses a very bruit force approach that greatly simplifies the code. The script re-processes the folder tree for every folder to find the newest file contained in that folder or any of it's sub-folders. I suspect the dates could be found more efficiently by loading the date into an array and sorting the data by paths or dates. But CPU cycles are cheap so the simple brute force approach was selected.

The progress bar starts a little jerky because the progress bar is displayed prior to doing a recursive scan to count the folders. The count can take a few seconds but without the progress bar the user would have no indicate that the script was processing. Once the folders are counted, the progress bar updates at the folder are processed. 

The script was developed in PowerShell v1.0 in Windows 7 Pro 64-bit. This script was developed after a glitch with DropBox caused all of my folder modification dates to be updated to the then current date. I like to view my project's folder by date so my most recent projects are on top and the oldest are at the bottom. A quick glance let's me see where I have been spending my time and which projects may be languishing. 

This was my first exposure to PowerShell. I used Google to search for examples of functional elements as I built the script. I did not keep track of what came from where because I was not certain that I would get the script to work the way I wanted, let alone want to share the script. I found several ways to implement almost every function and tried to always use what I thought was the least complicated approach. I apologize for the missing attributions. If you see a snippet of your code here, drop me a line and I will add a reference your name and a link. 

The bulk of the script and development time were devoted to providing a graphical user interface. The original working script was written to fix a problem I had when DropBox mishandled a Windows settings change. The original script had a hard-coded path and no user interface. I find the improved version with UI much more useful. 
