class BrokenLink < ActiveRecord::Base
  belongs_to :link

  filterable_by ['broken_links.error']
end
