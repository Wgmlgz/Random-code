
; example of simplified Windows programming using complex macro features

include 'win32ax.inc' ; you can simply switch between win32ax, win32wx, win64ax and win64wx here

.code

  start:
        FileTitle db 'somefile.txt',0
        hFile dd ?
        nSize dd ?
        lpBytesRead dd ?
        lpBuffer rb 8192


        invoke  CreateFile, FileTitle, GENERIC_READ, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
        ; TestApiError

        mov [hFile], eax

        invoke  GetFileSize, [hFile], 0
        ; TestApiError

        mov [nSize], eax

        invoke  ReadFile, [hFile], lpBuffer, [nSize], lpBytesRead, 0
        ; TestApiError

        invoke CloseHandle, [hFile]
        invoke  MessageBox,HWND_DESKTOP,"May I introduce myself?",invoke GetCommandLine,MB_YESNO

        .if eax = IDYES
                invoke  MessageBox,HWND_DESKTOP,"Hi! I'm the example program!","Hello!",MB_OK
        .endif

        invoke  ExitProcess,0

.end start
