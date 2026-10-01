Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(_TabTitles; 0)
		
		Infos:=ds:C1482.INFO.all().orderBy("PageNumber").toCollection()
		COLLECTION TO ARRAY:C1562(Infos.query("PageNumber<=3"); _TabTitles; "TabTitle")
		
		Calculation:=NewCalculation
		
		Names:=InitNames
		
		ApplyOnCollection(Names; Formula:C1597(This:C1470.displayName:=This:C1470.firstName))
		
End case 

