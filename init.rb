require 'redmine'

Redmine::Plugin.register :dynamic_issue_description do
  name 'Dynamic Issue Description Plugin'
  author 'GoApp'
  description 'A plugin to add a dynamic description field to issues'
  version '1.0.0'
  url 'https://github.com/GoApp-srl/RedmineModels.git'

  require File.expand_path('../lib/dynamic_issue_description/dynamic_issue_description_hook_listener', __FILE__)

  project_module :dynamic_issue_description do
    permission :view_dynamic_description, {} # puoi aggiungere controller/azioni qui
  end

end
