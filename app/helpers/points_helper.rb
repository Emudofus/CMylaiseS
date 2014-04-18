module PointsHelper
	def display_starpass_form
		#&theme=lemon_metal_small
		"<div id='starpass_#{APP_CONFIG['credit']['id']}'></div>
		<script id='starpass_script' src='http://script.starpass.fr/script.php?idd=#{APP_CONFIG['credit']['id']}&theme=grey_blue_small'></script>".html_safe
	end
end