
#copy and paste this in the same section of the cohens_d  code leaving the rest the same
#make sure to adjust the paired statement as needed

rstatix::wilcox_effsize(
  data = my.df,           #put the dataframe name here
  formula_object,      #continuous variable ~ factor 
  paired = TRUE,       #TRUE for within-subjects, FALSE for between-subjects
  alternative = "two.sided",
  ci = TRUE,
  conf.level = 0.95,
  ci.type = "bca",
  nboot = 1000)