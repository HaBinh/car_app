module ApplicationHelper

include SessionsHelper
include VehiclesHelper
include UsersHelper

# Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "CarApp"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
