:: Goal was to convert all .jp2 files to tif files
:: However, since I was dealing with Terabytes of data and many folders and subfolders, I needed to do this automatically
:: Also, it was neccessary for the images to be converted in the exact folder where the .jp2 files are, and for their names to remain the same 
:: Fastest way to do this was via GDAL ( http://www.gdal.org/ )which operates via Windows command prompt

for /r %%g in (*.jp2) do gdal_translate -co COMPRESS=LZW -co NUM_THREADS=ALL_CPUS %%g %%~dpng.tif

:: /r will make this batch script work recursively through subfolders
:: %g is a way to implement variable "g" inside Windows command prompt environment, "%%g" is used when the variable is implemented inside a batch file
:: gdal_translate is a GDAL command for conversion of files. It is easily implemented --> gdal_translate input_file.jp2 outputfile.tif) 
:: -co is a creation option that provides options such as type of compression, and number of CPU threads to be used for this process 
:: LZW is a common conversion algorhitm and was well suited for our needs
:: time was of essence, so ALL_CPUS were used for the batch script 
:: dpng.tif --> d= drive, p =path, n = name. This was a way to maintain the same name of all files after conversion