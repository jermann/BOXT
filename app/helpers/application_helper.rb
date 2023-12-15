module ApplicationHelper
  def sortable_link(column, title)
    direction = column == params[:sort_by] ? (params[:sort_direction] == 'asc' ? 'desc' : 'asc') : 'asc'
    arrow = column == params[:sort_by] ? (params[:sort_direction] == 'asc' ? '↑' : '↓') : ''

    link_to(title, home_index_path(sort_by: column, sort_direction: direction, min_available_space: params[:min_available_space], max_price_per_sqft: params[:max_price_per_sqft], max_distance_from_campus: params[:max_distance_from_campus]), class: 'sortable-link') +
      content_tag(:span, arrow, class: 'sort-arrow')
  end
end
