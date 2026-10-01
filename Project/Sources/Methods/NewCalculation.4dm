//%attributes = {"invisible":true}
// Initialize a new Calculation object
#DECLARE->$calc : Object

$calc:=New object:C1471

$calc.value1:=0
$calc.value2:=0

// Creation of object methods
//  binding of a formula ot an object
$calc.add:=Formula:C1597(This:C1470.value1+This:C1470.value2)
$calc.subtract:=Formula:C1597(This:C1470.value1-This:C1470.value2)
// binding of a method to an object
$calc.multiply:=Formula:C1597(multiply)
$calc.divide:=Formula:C1597(divide)
