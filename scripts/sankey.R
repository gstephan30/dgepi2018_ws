one <- df %>% 
  count(gender, hospital) %>%
  mutate_if(is.character, funs(ifelse(is.na(.), "NA_hospital", .)))
two <- df %>% 
  count(hospital, outcome) %>%
  mutate_if(is.character, funs(ifelse(is.na(.), "NA_hospital", .))) %>% 
  mutate(outcome = ifelse(outcome == "NA_hospital", "NA_outcome", outcome))
nodes <- unique(c(one$gender, one$hospital, two$outcome))

dfr <- vector("list", 3)
for (i in 1:nrow(one)) {
  dfr[[1]][i] <- match(one[i, 1], nodes)-1
  dfr[[2]][i] <- match(one[i, 2], nodes)-1
  dfr[[3]][i] <- as.numeric(one[i, 3])
}
names(dfr) <- c("source", "target", "value")
for (i in 1:nrow(two)) {
  dfr[[1]][i+nrow(one)] <- match(two[i, 1], nodes)-1
  dfr[[2]][i+nrow(one)] <- match(two[i, 2], nodes)-1
  dfr[[3]][i+nrow(one)] <- as.numeric(two[i, 3])
}
