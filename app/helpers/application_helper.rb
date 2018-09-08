module ApplicationHelper
	def bootstrap_class_for(name)
		{
			success: "alert-succes",
			error: "alert-danger",
			denger: "alert-danger",
			alert: "alert-warning",
			notice: "alert-info"
		}[name.to_sym] || name
end
