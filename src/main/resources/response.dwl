%dw 2.0
output application/json
---
payload map ((item,index)->
	{
	"plan": item.plan,
	"coverage": item.coverage,
	"premium": (((item.brackets filter($.minAge<vars.age and vars.age<$.maxAge))[0].premiumPerDay) 
		*
		       (daysBetween((vars.tripStartDate as Date), (vars.tripEndDate as Date))+1) 
	)
	
}
)