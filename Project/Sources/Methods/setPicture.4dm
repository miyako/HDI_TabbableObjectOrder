//%attributes = {"invisible":true}

#DECLARE($objectName : Text; $index : Integer)
var $Ptr : Pointer
var vPicTmp : Picture

$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "Pic"+$objectName)

var $w; $h : Integer
PICTURE PROPERTIES:C457($Ptr->; $w; $h)
If ($w=20)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"warning.png"; vPicTmp)
	COMBINE PICTURES:C987($Ptr->; vPicTmp; Horizontal concatenation:K61:8; $Ptr->)
End if 

If ($w<80)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Number"+Folder separator:K24:12+String:C10($index)+".png"; vPicTmp)
	COMBINE PICTURES:C987($Ptr->; $Ptr->; Horizontal concatenation:K61:8; vPicTmp)
End if 