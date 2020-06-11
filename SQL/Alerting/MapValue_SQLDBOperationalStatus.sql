/* mapping integer values to string values */ 
/* 
note: this is for the AppInsight for SQL. Database operation status value mappings
*/

SELECT 
    OperationalState
    ,CASE
        WHEN OperationalState = 0 THEN 'Online'
	WHEN OperationalState = 1 THEN 'Restoring'
	WHEN OperationalState = 2 THEN 'Recovering'
	WHEN OperationalState = 3 THEN 'Recovery Pending'
	WHEN OperationalState = 4 THEN 'Suspect'
	WHEN OperationalState = 5 THEN 'Emergency'
	WHEN OperationalState = 6 THEN 'Offline'
	WHEN OperationalState = 7 THEN 'Copying'	
        Else 'Not Found'
    End AS OperationalStringStatus
FROM APM_SQLBbDatabase 
  WHERE ID = '1'
