//%attributes = {"invisible":true}
// Apply a formula on each element of a collection
#DECLARE($names : Collection; $method : Object)

var $name : Object

For each ($name; $names)
	$method.call($name)
End for each 
