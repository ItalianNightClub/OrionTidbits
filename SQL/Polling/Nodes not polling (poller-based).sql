/* Servers that are Not Polling CPU */ 
SELECT 
    p.NetObjectID, 
    n.Caption, 
    n.ObjectSubType,
    c.DateTime
FROM Pollers p
LEFT JOIN NodesData n 
  ON n.NodeID = p.NetObjectID
OUTER APPLY (
			SELECT TOP (1) * 
			FROM CPULOad c 
			  WHERE c.NodeID = p.NetObjectID 
			  ORDER BY DateTime DESC
			) c
WHERE p.PollerType LIKE 'N.Cpu.%'
  AND c.DateTime <= DATEADD(Hour, -1,GETDATE())
  AND n.UnManaged = 'False'
