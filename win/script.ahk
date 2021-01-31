#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; 左右のWinキーを変換/無変換キーとして利用する
~LWin::Send,{vk1Dsc07B} ; 無変換
~RWin::Send,{vk1Csc079} ; 変換


; Ctrl + hjklでカーソル移動および範囲選択
LCtrl & h::
  if GetKeyState("shift", "P"){
    Send, +{Left}
  }else{
    Send,{Left}
  }
  return
LCtrl & j::
  if GetKeyState("shift", "P"){
    Send, +{Down}
  }else{
    Send,{Down}
  }
  return
LCtrl & k::
  If GetKeyState("shift", "P"){
    Send, +{Up}
  }else{
    Send,{Up}
  }
  return
LCtrl & l::
  If GetKeyState("shift", "P"){
    Send, +{Right}
  }else{
    Send,{Right}
  }
  return


; 左Ctrl + Spaceでスタートメニューを開く
LCtrl & Space::Send, ^{Esc}


; ホイールスクロールの方向を逆にする
;WheelUp::Send,{WheelDown}
;Return
;WheelDown::Send,{WheelUp}
;Return


; Ctrl + Shift + 3で全画面のスクリーショットを撮影する
#if GetKeyState("Ctrl", "P")
Shift & 3::RunWait PowerShell.exe -ExecutionPolicy Unrestricted -File .\screenshot_all.ps1 ,, hide

; Ctrl + Shift + 4 でアクティブウィンドウのスクリーンショットを撮影する
#if GetKeyState("Ctrl", "P")
Shift & 4::RunWait PowerShell.exe -ExecutionPolicy Unrestricted -File .\screenshot_window.ps1 ,, hide
