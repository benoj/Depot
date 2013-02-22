#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Depot::Application.load_tasks


task :test_and_add_files => [:test, :add_files_to_commit]
task :deploy => [:publish_to_github, :deploy_to_heroku]

task :test_deploy, :message do | t, args|
	Rake::Task[:test_and_add_files].invoke
	`git commit -m '#{args.message}'`
	Rake::Task[:deploy].invoke
end


task :add_files_to_commit do
	`git add .`
end

task :publish_to_github do
	`git push depot master`
end

task :deploy_to_heroku do
	`git push Depot master`
	`heroku run rake db:migrate`
end