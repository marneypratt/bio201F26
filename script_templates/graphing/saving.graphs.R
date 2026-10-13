#the code below will help you save your graph into a results subfolder
#make sure to create a results folder in the project folder first if needed
#you also need to give your graph an object name that gets stored 
#in the Environment in order to save the correct graph
#the package ggplot2 needs to be loaded for this code to work


# save the graph
# it is usually best to use .png or .jpg file types
ggsave(___,     #object name of a graph
       filename="results/___.png",  #file name you want to create
       height = 5, width = 8, units = "in", 
       dpi = 300)