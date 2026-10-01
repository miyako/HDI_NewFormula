//%attributes = {}
// Apply a formula on each element of a collection
C_COLLECTION:C1488($1; $names)
C_OBJECT:C1216($2; $method)
C_OBJECT:C1216($name)

$names:=$1
$method:=$2

For each ($name; $names)
	$method.call($name)
End for each 
