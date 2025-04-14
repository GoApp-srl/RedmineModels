require 'json'

class DynamicIssueDescriptionHookListener < Redmine::Hook::ViewListener
  def view_issues_form_details_top(context = {})
    project = context[:project]

    # Se il progetto non ha il modulo abilitato, non fare nulla
    return '' unless project&.module_enabled?(:dynamic_issue_description)

    # Carica il file JSON
    form_types_file = File.join(Redmine::Plugin.find(:dynamic_issue_description).directory, 'config', 'moduls.json')

    if File.exist?(form_types_file)
      form_types_data = JSON.parse(File.read(form_types_file))

      # Passa i dati al partial
      context[:controller].send(:render_to_string, {
        partial: 'hooks/issue_form_custom_field',
        locals: context.merge(form_types: form_types_data)
      })
    else
      Rails.logger.error "File form_types.json not found at path: #{form_types_file}"
    end
  end
end
