ActiveAdmin.register_page "Dashboard" do
	menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

	content title: proc { I18n.t("active_admin.dashboard") } do
		div class: "blank_slate_container", id: "dashboard_default_message" do
			span class: "blank_slate" do
				span I18n.t("active_admin.dashboard_welcome.welcome")
				small I18n.t("active_admin.dashboard_welcome.call_to_action")
			end
		end

		# Here is an example of a simple dashboard with columns and panels.
		#
		columns do
			column do
				panel "Projects" do
					ul do
						Project.all.map do |post|
							li link_to(post.title, admin_projects_path(post))
						end
					end
				end
			end
			column do
				panel "Tasks" do
					ul do
						Task.all.map do |post|
							li link_to(post.name, admin_tasks_path(post))
						end
					end
				end
			end
			column do
				panel "Attachments" do
					ul do
						Avatar.all.map do |post|
							li link_to(post.attachment, admin_avatars_path(post))
						end
					end
				end
			end
		end #columns
	end # content
	def index
	  authorize :dashboards, :index?
	end
end
