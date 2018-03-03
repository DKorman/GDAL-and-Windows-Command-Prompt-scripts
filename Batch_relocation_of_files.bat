:: Goal was to move aspecific files to corresponding subfolders. Since I was dealing with Terabytes of data and large number of folders,  i needed a way to do this automatically. 
:: Bellow is a batch script that moves all files of desired name and extension (in this case TIF files containig "SCL" in their name) to a specific subfolder containing called "R20". Script can be easily modified to batch copy any other specific files to any other folders.

for /r %%g in (*_SCL_*.tif) do (IF EXIST "%%~dpgR20m\" (Move "%%~g" "%%~dpgR20m\"))

:: /r will make this batch script work recursively through subfolders
:: %g is a way to implement variable "g" inside Windows command prompt environment, "%%g" is used when the variable is implemented inside a batch file
:: my goal was to search for all TIF files which contain "SLC" inside their name, * symbols are used as wildcards
:: "dpg" directs to the drive and path of the %%g variable, and adding "R20" after it selects the desired subfolder called "R20" in which i want to move the files 