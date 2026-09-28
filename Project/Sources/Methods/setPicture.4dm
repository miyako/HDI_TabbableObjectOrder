//%attributes = {"invisible":true}

C_TEXT:C284($1)
C_LONGINT:C283($2)
C_POINTER:C301($Ptr)
C_PICTURE:C286(vPicTmp)

$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Pic"+$1)

C_LONGINT:C283($w; $h)
PICTURE PROPERTIES:C457($Ptr->; $w; $h)
If ($w=20)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"warning.png"; vPicTmp)
	COMBINE PICTURES:C987($Ptr->; vPicTmp; Horizontal concatenation:K61:8; $Ptr->)
End if 

If ($w<80)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Number"+Folder separator:K24:12+String:C10($2)+".png"; vPicTmp)
	COMBINE PICTURES:C987($Ptr->; $Ptr->; Horizontal concatenation:K61:8; vPicTmp)
End if 