#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Depot::Application.load_tasks

task :heroku_setup do
	sh "heroku git:remote -a evening-wave-3621"
end
task :test_deploy, :message do | t, args|
	@git = GitRepository.new
	Rake::Task[:test].invoke
	commit(args.message,@git)
	Rake::Task[:push_to_origin].invoke
	Rake::Task[:deploy_to_heroku].invoke
end



task :push_to_origin do
	@git.push
end

task :deploy_to_heroku do
	heroku = GitRepository.new(:remote => "heroku")
	heroku.push
	`heroku run rake db:setup`
end

def commit(message,git_repository)
        if(git_repository.has_untracked?)
                git_repository.add
        end
        if(git_repository.has_changes?)
                git_repository.commit(:message => message, :options => "-a")
        end
end
