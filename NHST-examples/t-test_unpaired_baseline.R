#the code below uses the rstatix package to complete an unpaired t-test comparing the between subjects factor just for the baseline values


#computes the unpaired t-test
baseline.ttest <- ___  |>    #dataframe name
  filter(___ ==            #within subjects factor
           "____") |>      #baseline level name
  t_test(___ ~     #dependent variable
           ____,   #between subjects factor
         detailed = TRUE)  |> 
  add_significance()
baseline.ttest 


#computes the effect size using Cohen's d
___  |>    #dataframe name
  filter(___ ==            #within subjects factor
           "____") |>      #baseline level name 
  rstatix::cohens_d(___ ~     #dependent variable
              ____,   #between subjects factor
           var.equal = TRUE)