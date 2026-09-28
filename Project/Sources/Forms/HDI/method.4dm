Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		var $vers : Text
		$vers:=Application version:C493
		
		If ($vers<"1640")  //1530 means 15R3   1501 means 15.1
			
			Form.quit:=True:C214
			OBJECT SET TITLE:C194(*; "BtnDemo"; Localized string("BtnClose"))
			OBJECT SET VISIBLE:C603(*; "TxtSorry@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "TxtInfo@"; False:C215)
			
		Else 
			
			Form.quit:=False:C215
			
		End if 
		
End case 
