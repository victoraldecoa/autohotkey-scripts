; this is a modification of the following Gist by Craig Patik: https://gist.github.com/patik/672d81b94195c418d855360529fe8008
; changes:
;  - set tilde diacritic shortcut to "n" instead of "t"
;  - update script to work with newer versions of AutoHotKey by replacing all instances of "VKC0SC029" by "sc029"

#UseHook
!sc029::Return 	; grave -> the grave ` accent gave some probs, used the virtualkey + scancode instead
!e::Return         	; acute
!i::Return          ; circumflex
!n::Return         	; tilde
!u::Return          ; umlaut

;                  1 2 3 4 5 6 7 8 9 1
;                                    0
;              r   g G a A c C t T u U
*a::diacritic("a","à,À,á,Á,â,Â,ã,Ã,ä,Ä")
*e::diacritic("e","è,È,é,É,ê,Ê,e,E,ë,Ë")
*i::diacritic("i","ì,Ì,í,Í,î,Î,i,I,ï,Ï")
*o::diacritic("o","ò,Ò,ó,Ó,ô,Ô,õ,Õ,ö,Ö")
*u::diacritic("u","ù,Ù,ú,Ú,û,Û,u,U,ü,Ü")
*n::diacritic("n","n,N,n,N,n,N,ñ,Ñ,n,N")
*y::diacritic("y","y,Y,y,Y,y,Y,y,Y,ÿ,Ÿ")

diacritic(regular,accentedCharacters) {
    StringSplit, char, accentedCharacters, `,
    graveOption            := char1
    graveShiftOption       := char2
    acuteOption            := char3
    acuteShiftOption       := char4
    circumflexOption       := char5
    circumflexShiftOption  := char6
    tildeOption            := char7
    tildeShiftOption       := char8
    umlautOption           := char9
    umlautShiftOption      := char10
    
    if (A_PriorHotKey = "!sc029" && A_TimeSincePriorHotkey < 2000) {
        if (GetKeyState("Shift")) {
            SendInput % graveShiftOption
        } else {
            SendInput % graveOption
        }
    } else if (A_PriorHotKey = "!e" && A_TimeSincePriorHotkey < 2000) {
        if (GetKeyState("Shift")) {
            SendInput % acuteShiftOption
        } else {
            SendInput % acuteOption
        }
    } else if (A_PriorHotKey = "!i" && A_TimeSincePriorHotkey < 2000) {
        if (GetKeyState("Shift")) {
            SendInput % circumflexShiftOption
        } else {
            SendInput % circumflexOption
        }		
    } else if (A_PriorHotKey = "!n" && A_TimeSincePriorHotkey < 2000) {
        if (GetKeyState("Shift")) {
            SendInput % tildeShiftOption
        } else {
            SendInput % tildeOption
        }
    } else if (A_PriorHotKey = "!u" && A_TimeSincePriorHotkey < 2000) {
        if (GetKeyState("Shift")) {
            SendInput % umlautShiftOption
        } else {
            SendInput % umlautOption
        }
    } else {
        if (GetKeyState("Shift") or GetKeyState("Capslock","T")) {
            SendInput % "+" regular
        } else {
            SendInput % regular
        }
    }
}

;
; Alt + Shift + key
;
*!1::altShift("¡","/")
*!2::altShift("€","™")
*!3::altShift("£","‹")
*!4::altShift("¢","›")
*!5::altShift("8","fi")
*!6::altShift("§","fl")
*!7::altShift("¶","‡")
*!8::altShift("•","°")
*!9::altShift("ª","·")
*!0::altShift("º","‚")

*!a::altShift("å","Å")
*!b::altShift("?","i")
*!c::altShift("ç","Ç")
*!d::altShift("?","Î")
*!e::altShift("´","‰")
*!f::altShift("ƒ","Ï")
*!g::altShift("©","Ì")
*!h::altShift("?","Ó")
*!i::altShift("^","È")
*!j::altShift("?","Ô")
*!k::altShift("°","Apple")
*!l::altShift("¬","Ò")
*!m::altShift("µ","˜")
*!n::altShift("˜","ˆ")
*!o::altShift("ø","Ø")
*!p::altShift("p","?")
*!q::altShift("œ","Œ")
*!r::altShift("®","Â")
*!s::altShift("ß","Í")
*!t::altShift("†","Ê")
*!u::altShift("¨","Ë")
*!v::altShift("v","?")
*!w::altShift("e","„")
*!x::altShift("˜","Ù")
*!y::altShift("¥","Á")
*!z::altShift("?","Û")

*!-::altShift("–","—")
*!=::altShift("!=","±")
*![::altShift("“","”")
*!]::altShift("‘","’")
*!`;::altShift("…","Ú")
*!'::altShift("æ","Æ")
*!\::altShift("«","»")
*!,::altShift("<=","¯")
*!.::altShift(">=","?")
*!/::altShift("÷","¿")	

altShift(accented,accentedShift) {
    if (!GetKeyState("Shift")) {
        SendInput % accented
    } else {
        SendInput % accentedShift
    }
}

; Fix for some CTRL + stuff that may not work
; This must be done for each character with diacritics as defined near the top of the script
^a::
    SetKeyDelay -1
    Send ^a
    return

^+a::
    SetKeyDelay -1
    Send ^+a
    return

^e::
    SetKeyDelay -1
    Send ^e
    return

^+e::
    SetKeyDelay -1
    Send ^+e
    return

^i::
    SetKeyDelay -1
    Send ^i
    return

^+i::
    SetKeyDelay -1
    Send ^+i
    return

^o::
    SetKeyDelay -1
    Send ^o
    return

^+o::
    SetKeyDelay -1
    Send ^+o
    return

^u::
    SetKeyDelay -1
    Send ^u
    return

^+u::
    SetKeyDelay -1
    Send ^+u
    return

^n::
    SetKeyDelay -1
    Send ^n
    return

^+n::
    SetKeyDelay -1
    Send ^+n
    return

^y::
    SetKeyDelay -1
    Send ^y
    return

^+y::
    SetKeyDelay -1
    Send ^+y
    return
