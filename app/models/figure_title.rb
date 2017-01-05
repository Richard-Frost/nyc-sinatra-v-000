class FigureTitle < ActiveRecord::Base
  belongs_to :figure
  belongs_to :title
end

#george_w = Figure.create(name: "George Washington")
#cherry_tree = Landmark.create(name: "Cherry Tree", figure_id: george_w.id, year_completed: 1738)
#president = Title.create(name: "president")
#FigureTitle.create(title_id: president.id, figure_id: george_w.id)