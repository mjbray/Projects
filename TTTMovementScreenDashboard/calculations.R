getNames <- function(data) {
  names <- data.frame(data$Name.)
  return(names)
}

df = read.csv("/Users/Margaret/Documents/Projects/TTT/Project 1/TTT_Sample_Screen.csv", header=TRUE)
names = getNames(df)

selected.df = df[df$Name. == "Mike McTest",]