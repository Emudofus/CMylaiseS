return unless credit_type?
<-! $
setTimeout -> /*may take time to load*/
	switch credit_type
		when 'star'
			csrf_meta = $ 'meta[name=csrf-token]' .attr 'content'
			$ "\#sk-code-validation-form-#credit_id"
				.attr 'action' credit_url
				.append do
					$ '<input />' name: 'authenticity_token' type: 'hidden' value: csrf_meta
, 500

$newsTitle = $ '.newsTitle'
$newsTitle.html "#{$newsTitle.html!} (#{credit_points} points)"