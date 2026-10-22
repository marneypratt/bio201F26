## make sure to have the ggpubr package loaded and variables defined to get this code to run


#make a QQ plot for each dependent variable that is continuous
ggpubr::ggqqplot(
  data = mydf,               #put the data frame name here 
  x = {{ cont_var }},                  #put the continuous variable name here
  color = {{ b_factor }},       #put the between subjects factor here (remove if no factors)
  facet.by = {{ w_factor }}  #put the within subjects factors here (remove if no factors)
)   