# Application helper
module ApplicationHelper
  def bootstrap_class_for(flash_type)
    if flash_type == 'success'
      'alert-success'
    elsif flash_type == 'error'
      'alert-danger'
    elsif flash_type == 'notice'
      'alert-info'
    end
  end
end
