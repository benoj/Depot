#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Depot::Application.load_tasks

task :test_deploy, :message do | t, args|
	@git = GitRepository.new
	Rake::Task[:test].invoke
	commit(args.message,@git)
	Rake::Task[:push_to_origin].invoke
	#Rake::Task[:deploy_to_heroku].invoke
end



task :push_to_origin do
	@git.push
end

task :deploy_to_heroku do
	`git push heroku master`
	`heroku run rake db:migrate`
end


def commit(message,git_repository)
        if(git_repository.has_untracked?)
                git_repository.add
        end
        if(git_repository.has_changes?)
                git_repository.commit(:message => message, :options => "-a")
        end
end
