#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Depot::Application.load_tasks


task :test_and_add_files => [:test,:add_files_to_commit]

task :test_deploy, :message do | t, args|
	Rake::Task[:test_and_add_files].invoke
	git = GitRepository.new
	git.commit("this is a test")
	Rake::Task[:publish_to_github].invoke
	Rake::Task[:deploy_to_heroku].invoke
end

task :add_files_to_commit do
	sh "git add ."
end

task :publish_to_github do
	sh "git push depot master"
end

task :deploy_to_heroku do
	`git push heroku master`
	`heroku run rake db:migrate`
end


class GitRepository
	def commit(message)
		puts "git commit -m '#{message}'"
		 system "git commit -m '#{message}'"
	end
end