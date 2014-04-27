#  read training data
subject.train = read.table("./train/subject_train.txt")
x.train = read.table("./train/X_train.txt")
y.train = read.table("./train/y_train.txt")

#  read test data
subject.test = read.table("./test/subject_test.txt")
x.test = read.table("./test/X_test.txt")
y.test = read.table("./test/y_test.txt")

#  read labels and features
feature.name = read.table("features.txt")
activity.label = read.table("activity_labels.txt")

#  column bind y
y.test.new = cbind(y.test, subject.test)
colnames(y.test.new) = c("Activity", "Subject")

y.train.new = cbind(y.train, subject.train)
colnames(y.train.new) = c("Activity", "Subject")

#  merge y and X
x.total = rbind(x.train, x.test)
y.total = rbind(y.train.new, y.test.new)

#  name x.total
colnames(x.total) = feature.name[,2]

#  find the mean and std variables
idx.mean = grep("-mean()", feature.name[,2], fixed=T)
idx.std = grep("-std()", feature.name[,2], fixed=T)
idx.find = sort(c(idx.mean, idx.std))

#  extract data
x.new = x.total[,idx.find]
x.new = cbind(y.total, x.new)

#  mark the name of activity
for (i in seq(1:length(activity.label[,2]))) {
  idx = x.new$Activity == i
  x.new[idx, "Activity.Name"] =  activity.label[i, 2]
}

#  calculate mean and std for each subject or activity
f = split(x.new[,1:68], list(x.new$Activity.Name, x.new$Subject))
x.split = sapply(f, colMeans)
x.new1 = data.frame(t(x.split))

for (i in seq(1:length(activity.label[,2]))) {
  idx = x.new1$Activity == i
  x.new1[idx, "Activity.Name"] =  activity.label[i, 2]
}

library(plyr)
x.final = arrange(x.new1, Activity)

#  output to table
write.table(x.final, "Analysis_result.txt")