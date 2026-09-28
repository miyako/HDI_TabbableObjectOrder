//%attributes = {"invisible":true}
ARRAY TEXT:C222($arrTabOrderObjet; 0)
var $Ptr : Pointer
var $i : Integer

FORM GET ENTRY ORDER:C1469($arrTabOrderObjet; *)

clearPicture

For ($i; 1; Size of array:C274($arrTabOrderObjet))
	$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "List"+String:C10($i))
	$Ptr->:=Find in list:C952(listObjectName; $arrTabOrderObjet{$i}; 0)
	setPicture($arrTabOrderObjet{$i}; $i)
End for 

If (Size of array:C274($arrTabOrderObjet)<9)
	For ($i; Size of array:C274($arrTabOrderObjet)+1; 9)
		$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "List"+String:C10($i))
		$Ptr->:=Find in list:C952(listObjectName; " "; 0)
	End for 
End if 

OBJECT SET VISIBLE:C603(*; "PicWarning"; False:C215)
OBJECT SET VISIBLE:C603(*; "StWarning"; False:C215)
