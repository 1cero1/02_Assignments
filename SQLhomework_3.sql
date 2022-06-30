
-----Create above table (Actions) and insert values

CREATE table [Actions](
     [Visitor_ID ][int] identity (1,1) ,
     [Adv_type][char] ,
     [Action][varchar](10) 
)

SELECT *
FROM Actions

SET IDENTITY_INSERT dbo.Actions on

Insert Into dbo.Actions (Visitor_ID,Adv_type,Action) 
VALUES (1,'A','Left'),
       (2,'A','Order'),
       (3,'B','Left'),
       (4,'A','Order'),
       (5,'A','Review'),
       (6,'A','Left'),
       (7,'B','Left'),
       (8,'B','Order'),
       (9,'B','Review'),
       (10,'A','Review')  


-------Retrieve count of total Actions and Orders for each Adversitment Type

SELECT adv_type ,count(*) as total_action
FROM dbo.Actions
WHERE Action = 'Order'
GROUP BY Adv_type

--------Calculate Orders (Conversion) rates for each Adversitement Type by dividing by Total count of actions casting as float by multiplying by 1.0


select Adv_Type,
SUM(CASE WHEN [Action] = 'Order' THEN 1 ELSE 0 END)/(COUNT([Action])*1.0) as Conversion_Rate
from dbo.Actions
group by Adv_Type 


select distinct a.adv_type, format(b.total/(c.total_actions*1.0), 'N2') conversion_rate
from actions a
right join (select adv_type, count(*) total
	from dbo.actions
	where [action] = 'Order'
	group by adv_type) b
on a.adv_type=b.adv_type
right join (select adv_type, count(*) total_actions
	from dbo.actions
	group by adv_type) c
on a.adv_type=c.adv_type