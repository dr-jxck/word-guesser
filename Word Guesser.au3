#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\Downloads\statistics.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
HotKeySet("{INS}","stop")

global $word = ""

func input()
	$word = InputBox("Word Guesser [by Jxck-Dev]","Enter a word for me to guess!" & @CRLF & @CRLF & "(No numbers, symbols or spaces!)")
	$word = StringLower($word)
	$word = StringReplace($word," ","")

	if StringIsSpace($word) Then
		Exit
	elseif StringIsDigit($word) or StringIsFloat($word) or StringIsInt($word) or StringRegExp($word, "[0-9]") Then
		MsgBox(0,"Word Guesser","Invalid word." & @CRLF & StringIsDigit($word) & StringIsFloat($word) & StringIsInt($word) & StringIsXDigit($word) & StringRegExp($word, "[0-9]"))
		input()
	EndIf

	reset()
EndFunc

Func reset()
	global $guesses = 0
	global $str = ""
	global $digits = StringLen($word)
	global $totalGuesses = "inf"
	Global $aSpace[3]
	Global $name = "Word Guesser"

	MsgBox(0,$name,"I'm going to try to guess '" & $word & "'.")

	SplashTextOn($name,"Trying to guess '" & $word & "'." & @CRLF & @CRLF & "One moment please!" & @CRLF & "Use INSERT to stop.",300,100,@DesktopWidth/2,@DesktopHeight/2,18)

	main()
EndFunc


func guess()
	$str = ""

	For $i = 1 To $digits
		$aSpace[1] = Chr(Random(97, 122, 1))
		$str &= $aSpace[1]
	Next

	Return $str
EndFunc

Func main()
	While 1
		$guess = guess()
		$guesses += 1

		if $guess == $word Then
			SplashOff()
			ClipPut($guesses)
			MsgBox(0,$name,"Guessed '" & $guess & "' after " & $guesses & " tries!"& @CRLF & @CRLF & "My guess is: " & String($guess==$word))
			input()
		EndIf
	WEnd
EndFunc

Func stop()
	Exit
EndFunc

input()