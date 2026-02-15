%dw 2.0
output application/json
---
{
    "message": "OK",
    "reason": "health check",
    "response": {
        "application": p('api.Name'),
        "buildVersion": p('api.Version'),
        "buildTimeStamp": now(),
        "code": if (payload.code contains "ERROR") "ERROR" else "OK",
        "failed": if (payload.code contains "ERROR") true else false,
        "host": vars.host default attributes.headers.host,
        "tier": p('mule.env'),
        "systems": [
            {
                "code": if (payload.code contains "ERROR") "ERROR" else "OK",
                "message": if (payload.code contains "ERROR") 
                              "Salesforce is not reachable" 
                           else 
                              "Salesforce is reachable",
                "name": "ej.salesforce.com"
            }
        ]
    },
    "status": 200
}
