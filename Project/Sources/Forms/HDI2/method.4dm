
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		initHDI
		
		listObjectName:=New list:C375
		APPEND TO LIST:C376(listObjectName; "Subform"; 1)
		APPEND TO LIST:C376(listObjectName; "Page0_Variable"; 2)
		APPEND TO LIST:C376(listObjectName; "Page0_ComboBox"; 3)
		APPEND TO LIST:C376(listObjectName; "Variable"; 4)
		APPEND TO LIST:C376(listObjectName; "CheckBox"; 5)
		APPEND TO LIST:C376(listObjectName; "RadioButton"; 6)
		APPEND TO LIST:C376(listObjectName; "DropDown"; 7)
		APPEND TO LIST:C376(listObjectName; "ComboBox"; 8)
		APPEND TO LIST:C376(listObjectName; "Button"; 9)
		APPEND TO LIST:C376(listObjectName; " "; 10)
		
		For ($i; 1; 9)
			OBJECT SET LIST BY REFERENCE:C1266(*; "List"+String:C10($i); listObjectName)
		End for 
		
	: (Form event code:C388=On Page Change:K2:54)
		
		OBJECT SET VISIBLE:C603(*; "PicPage0_Variable"; (FORM Get current page:C276>1))
		OBJECT SET VISIBLE:C603(*; "TextPage0_Variable"; (FORM Get current page:C276>1))
		OBJECT SET VISIBLE:C603(*; "Page0_Variable"; (FORM Get current page:C276>1))
		
		OBJECT SET VISIBLE:C603(*; "PicPage0_ComboBox"; (FORM Get current page:C276>1))
		OBJECT SET VISIBLE:C603(*; "TextPage0_ComboBox"; (FORM Get current page:C276>1))
		OBJECT SET VISIBLE:C603(*; "Page0_ComboBox"; (FORM Get current page:C276>1))
		
		If (FORM Get current page:C276=2)
			getTabOrder
		End if 
		
	: (Form event code:C388=On Unload:K2:2)
		
		If (Is a list:C621(listObjectName))
			CLEAR LIST:C377(listObjectName; *)
		End if 
		
End case 