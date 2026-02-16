%dw 2.0
output application/json
---
[
	{
		"ExternalId__c"    : payload.productId,
		"CurrencyCode__c"  : payload.currencyCode,
		"Description"      : payload.description,
		"Name"             : payload.productName,
		"ProductPrice__c"  : payload.productPrice,
		"Id"               : vars.productId[0].Id
	
     }
]