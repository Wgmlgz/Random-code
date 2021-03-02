format pe console 4.0
include 'win32ax.inc'
 
.data
        FileTitle db 'file.txt',0
        hFile dd ?
        nSize dd ?
        lpBytesRead dd ?
        lpBuffer rb 8192
 
        MessageBoxCaption db 'Output:',0
.code
        start:
        invoke  CreateFile, FileTitle, GENERIC_READ, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0 ; Open the file (to get its handle)
        ; TODO: TestApiError
        mov [hFile], eax ; Save the file's handle to hFile
        invoke  GetFileSize, [hFile], 0 ; Determine the file size
        ; TODO: TestApiError
        mov [nSize], eax ; Save the file size given by EAX
        invoke  ReadFile, [hFile], lpBuffer, [nSize], lpBytesRead, 0 ; Now read the full file
        ; TODO: TestApiError
        invoke CloseHandle, [hFile] ; Handle should be closed after the file has been read
        invoke MessageBox, NULL, addr lpBuffer, addr MessageBoxCaption, MB_OK ; Easy way of outputing the text
        invoke  ExitProcess, 0
 