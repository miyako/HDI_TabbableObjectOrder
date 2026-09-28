//%attributes = {"invisible":true}
ARRAY TEXT:C222($arrTabOrderObjet; 0)
ARRAY TEXT:C222($arrGet; 0)
C_POINTER:C301($Ptr)
C_TEXT:C284($objectName)
C_LONGINT:C283($i; $ref)

clearPicture

// retrieve the order defined by the user
For ($i; 1; 9)
	$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "List"+String:C10($i))
	GET LIST ITEM:C378(listObjectName; $Ptr->; $ref; $objectName)
	If ($objectName#" ")
		APPEND TO ARRAY:C911($arrTabOrderObjet; $objectName)
		setPicture($objectName; $i)
	End if 
End for 

// set the order
FORM SET ENTRY ORDER:C1468($arrTabOrderObjet)

// check if error in the array
FORM GET ENTRY ORDER:C1469($arrGet; *)
If (Size of array:C274($arrTabOrderObjet)#Size of array:C274($arrGet))
	OBJECT SET VISIBLE:C603(*; "PicWarning"; True:C214)
	OBJECT SET VISIBLE:C603(*; "StWarning"; True:C214)
Else 
	OBJECT SET VISIBLE:C603(*; "PicWarning"; False:C215)
	OBJECT SET VISIBLE:C603(*; "StWarning"; False:C215)
End if 


// set Focus to the first object in the array
If (Size of array:C274($arrGet)>0)
	If ($arrGet{1}="Subform")
		EXECUTE METHOD IN SUBFORM:C1085("Subform"; "goToFirstObjectInSubform")
	Else 
		GOTO OBJECT:C206(*; $arrGet{1})
	End if 
Else 
	GOTO OBJECT:C206(*; "")
End if 