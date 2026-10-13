#to run this code, make sure the rstatix package is loaded
#make sure you have also already defined your variables (cont.var & w.factor.var)

#set the formula to use the defined variables 
#this makes it easier to change the variables at the top and rerun everything 
#without having to retype the variables in every code chunk
response <- cont.var
predictor <- w.factor.var
formula_string <- paste0(response, " ~ ", predictor)
formula_object <- as.formula(formula_string)


#computes the effect size using Cohen's d
#can change the var.equal option for equal or unequal variance as needed
time.effectSize.results <- 
  rstatix::cohens_d(
    data = my.df,           #put the dataframe name here
    formula_object,      #continuous variable ~ factor 
    paired = TRUE,       #TRUE for within-subjects, FALSE for between-subjects
    var.equal = FALSE,   #TRUE for equal variance, FALSE for unequal variance
    hedges.correction = TRUE,
    ci = TRUE,
    conf.level = 0.95,
    ci.type = "bca",
    nboot = 1000)
time.effectSize.results

#make the graph
time.effect.plot <- time.effectSize.results  |>    
  ggplot(aes(
    x = .y., 
    y = effsize)) +
  
  geom_pointrange(aes(ymin = conf.low, ymax = conf.high),
                  size = 1, # Adjust point size
                  linewidth = 0.8, # Adjust line thickness
                  color = "steelblue") + # Set color
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey50") + # Add a reference line at 0
 
   #nicer axis labels
  xlab("Difference Between Times") +
  ylab("Standardized Effect Size") +
  
  
  #additional formatting
  theme_classic(base_size = 14)  +  #sets the font size
  theme(axis.text.x = element_blank()) +
  theme(legend.position = "none")   #controls legend/key

time.effect.plot