data_medical_charges <- read.csv("~/Documents/Review phase/Block 1/R.R/Course material/data_medical_charges.csv")
View(data_medical_charges)

model1 <- lm(charges ~ age + bmi + sex, data =data_medical_charges)
summary(model1)
# check the assumption 3 (linear association):
plot(model1, which=1)
# check the assumption 4 (homoskedastic):
plot(model1, which=3)

# check the assumption 5 (normality):
plot(model1, which=2)


# check potential outliers
plot(model1, which=4)

model2 <- lm(charges~ age+sex+bmi+children+region,data = data_medical_charges)
summary(model2)
#we can remove region because it is has no significant; here look on p- value if it is great than 5%, or not having ***
model3 <- lm(charges~ age+sex+bmi+children,data = data_medical_charges)
summary(model3)

anova(model1, model3)
