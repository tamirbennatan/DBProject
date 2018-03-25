##########
# Two figures, saved to files:
# - visualizations/project_points_treemap.png
# - visualizations/team_points_goals.png
##########


library(dplyr)
library(ggplot2)
library(treemapify)


# read data on projects and points
project.points = read.csv("project_points.csv")

# First plot
p1 = project.points %>%
      mutate(projid = paste("Proj.", projid)) %>%
      ggplot(aes(area = total_points, label = projid, subgroup = companyname, fill = companyname)) +
      geom_treemap() + 
      geom_treemap_subgroup_border() +
      geom_treemap_subgroup_text(place = "center", grow = T, alpha = 0.5, colour =
                                       "black", fontface = "italic", min.size = 0) +
      geom_treemap_text(colour = "white", place = "topleft", reflow = T) +
      theme(legend.position = "null") + 
      geom_treemap_text(aes(label = total_points,size = 3),
                        colour = "blue", place = "bottomright", reflow = T) +
      theme(legend.position = "null") + 
      labs(title = "Points requested by clients, per project.",
           subtitle = "Area proportional to points requested (annotated in bottom right)")

# Read points data
points.goal <- read.csv("points_vs_goal.csv") %>%
      mutate(pointgoal = 15)

# Second plot
p2 = points.goal %>%
      mutate(points.surplus = total_points - pointgoal) %>%
      mutate(reached.goal = points.surplus >=0) %>%
      ggplot(aes(x = sprintnumber, y = points.surplus, fill = reached.goal)) +
      geom_col() + 
      facet_wrap(~teamname , ncol = 5, scales = "free")


# save plots
ggsave("../../deliverables/p3/project_points_treemap.png", p1)
ggsave("../../deliverables/p3/team_points_goals.png", p2)

























