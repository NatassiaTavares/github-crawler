FactoryBot.define do
	#TODO create other factories with different github_ids
	factory :repository do
		github_id 34526884
		name "cats"
		full_name "typelevel/cats"
		private false
		html_url "https://github.com/typelevel/cats"
		description "Lightweight, modular, and extensible library for f.."
		fork false
		open_issues 277
		watchers 3345
		score 1.0
		language "Scala"

		owner
	end

	factory :owner do
		url "https://api.github.com/users/typelevel"
		html_url "https://github.com/typelevel"
		login "typelevel"
	end
end