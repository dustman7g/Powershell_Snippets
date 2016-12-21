#this switch will take the last exit code after a robocopy and change the last exit code for the code 1 to 7 to 0 so Jenkins Build Failure Analyzer will show as successful

Switch($LASTEXITCODE){

	"0" {	$LASTEXITCODE = "0"
			Write-Host "No errors occurred, and no copying was done.
                   The source and destination directory trees are completely synchronized. "}
				   
	"1" {	$LASTEXITCODE = "0"
			Write-Host "One or more files were copied successfully (that is, new files have arrived). "}
	
	"2" {	$LASTEXITCODE = "0"
			Write-Host "Some Extra files or directories were detected. No files were copied
                   Examine the output log for details. "}
				   
	"3" {	$LASTEXITCODE = "0"
			Write-Host "(2+1) Some files were copied. Additional files were present. No failure was encountered. "}

	"4" {	$LASTEXITCODE = "0"
			Write-Host " Some Mismatched files or directories were detected.
                   Examine the output log. Housekeeping might be required."}
	
	"5" {	$LASTEXITCODE = "0"
			Write-Host "(4+1)Some files were copied. Some files were mismatched. No failure was encountered."}
	
	"6" {	$LASTEXITCODE = "0"
			Write-Host "(4+2) Additional files and mismatched files exist. No files were copied and no failures were encountered.
                   This means that the files already exist in the destination directory"}
	
	"7" {	$LASTEXITCODE = "0"
			Write-Host "(4+1+2) Files were copied, a file mismatch was present, and additional files were present."}
	
	"8" {Write-Host "Some files or directories could not be copied
                   (copy errors occurred and the retry limit was exceeded).
                   Check these errors further."}
				   
	"16"{Write-Host "Serious error. Robocopy did not copy any files.
                   Either a usage error or an error due to insufficient access privileges
                   on the source or destination directories."}
}
