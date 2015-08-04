module ApplicationHelper

  def database_important_columns?(column)
    return true unless column == 'id' || column == 'created_at' || column == 'updated_at' 
  end

  def add_datasheet_tube_sub(tube)
    tube = tube.class
    address = "add_datasheet_"+"#{tube}"
    address = address.downcase.to_sym
  end

  def edit_tube_sub(tube)
    tube = tube.class
    address = "edit_"+"#{tube}"
    address = address.downcase.to_sym
  end

  def destroy_confirm_tube_sub(tube)
    tube = tube.class
    address = "destroy_confirm_"+"#{tube}"
    address = address = address.downcase.to_sym
  end

  def is_tube?(tube)
    return true if tube.class == Triode ||
                   tube.class == Triodepentode ||
                   tube.class == Tetrode ||
                   tube.class == Diode ||
                   tube.class == Pentode
  end

end
