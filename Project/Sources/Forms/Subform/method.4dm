
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		// define the subform order
		ARRAY TEXT:C222($arrTab; 0)
		APPEND TO ARRAY:C911($arrTab; "Variable")
		APPEND TO ARRAY:C911($arrTab; "Check Box")
		
		FORM SET ENTRY ORDER:C1468($arrTab; 1)
End case 
