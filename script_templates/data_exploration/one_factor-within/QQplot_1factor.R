## make sure to have the ggpubr package loaded 
# make sure your variables are already defined using "define_variables.R"


#make a QQ plot for each dependent variable that is continuous
ggpubr::ggqqplot(
  data = mydf,               #put the data frame name here 
  x = {{ cont_var }},                  #put the continuous variable name here
  color = {{ w_factor }} #put the within subjects factors here (remove if no factors)
)   