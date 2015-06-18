module ApplicationHelper

  def database_important_columns?(column)
    return true unless column == 'id' || column == 'created_at' || column == 'updated_at' 
  end


end
