$PBExportHeader$uo_encrypt.sru
$PBExportComments$Encrypts and decrypts strings
forward
global type uo_encrypt from nonvisualobject
end type
end forward

global type uo_encrypt from nonvisualobject
end type
global uo_encrypt uo_encrypt

type variables
string is_raw, is_encrypted, is_key="CGI"


end variables

forward prototypes
public function STRING of_getraw ()
public function string of_decrypt (string thetext, string thekey)
public function string of_decrypt (string thestr)
public function string of_getencrypted ()
public function string of_setkey (string thekey)
public function string of_encrypt (string thestr)
public function string of_encrypt (string thetext, string thekey)
end prototypes

public function STRING of_getraw ();return is_raw
end function

public function string of_decrypt (string thetext, string thekey);// Chagned input variable order to match documentation

of_setKey(theKey)
return of_decrypt(theText)
end function

public function string of_decrypt (string thestr);string retVal, tempStr, tStr
int sourcePtr, keyPtr, keyLen, sourceLen, tempVal, tempKey

is_encrypted = thestr

keyPtr = 1
keyLen = LenA(is_key)
// Fixed so that decryption is done on encrypted input string of proper length
//sourceLen = len(is_raw)
sourceLen = LenA(is_encrypted)
is_raw = ""
for sourcePtr = 1 to sourceLen
	tempVal = AscA(RightA(is_encrypted, LenA(is_encrypted) - sourcePtr + 1))
	tempKey = AscA(RightA(is_key, LenA(is_key) - keyPtr + 1))
	tempVal -= tempKey
	// Added this section to ensure that ASCII codes stay in 0 to 255 range
	DO WHILE tempVal < 0
		if tempVal < 0 then
			tempVal = tempVal + 255
		end if
	LOOP
	// end of section
	tStr = CharA(tempVal)
	is_raw += tStr
	keyPtr ++
	if keyPtr > LenA(is_key) then keyPtr = 1
next

retVal = is_raw

return retVal
end function

public function string of_getencrypted ();return is_encrypted
end function

public function string of_setkey (string thekey);string retVal
retVal = is_key
is_key = theKey
return retVal
end function

public function string of_encrypt (string thestr);string retVal, tempStr, tStr
int sourcePtr, keyPtr, keyLen, sourceLen, tempVal, tempKey

retVal = is_raw
is_raw = thestr

keyPtr = 1
keyLen = LenA(is_key)
sourceLen = LenA(is_raw)
is_encrypted = ""
for sourcePtr = 1 to sourceLen
	tempVal = AscA(RightA(is_raw, sourceLen - sourcePtr + 1))
	tempKey = AscA(RightA(is_key, keyLen - keyPtr + 1))
	tempVal += tempKey
	// Added this section to ensure that ASCII Values stay within 0 to 255 range
	DO WHILE tempVal > 255
		if tempVal > 255 then
			tempVal = tempVal - 255
		end if
	LOOP
	// End of Section
	tStr = CharA(tempVal)
	is_encrypted += tStr
	keyPtr ++
	if keyPtr > LenA(is_key) then keyPtr = 1
next

return is_encrypted
end function

public function string of_encrypt (string thetext, string thekey);of_setKey(theKey)
return of_encrypt(theText)
end function

on uo_encrypt.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_encrypt.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

