#this is the linear regression model we used to train the app with sample answers to determine the severity of the user's conditions
#in the result column, 5 is an urgent condition and 0 is normal

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#get the data
df = pd.read_csv('independence_app_answers.csv')

#filter data
#possible words about negative conditions
negative = ['hurt', 'hurts', 'pain', 'fall', 'fell', 'fallen', 'painful', 'worse',
            'bruises', 'cuts', 'infected', 'infection', 'heavy', 'injured', 'dizzy', 'very', 'not sure']

#set first column into dummies
for c, i in df['Q1'].iteritems():
    for word in negative:
        if word in i:
            df['Q1'][c] = '1'

for c,i in df['Q1'].iteritems():
    if i != '1':
        df['Q1'][c] = '0'

#second column
for c, i in df['Q2'].iteritems():
    for word in negative:
        if word in i:
            df['Q2'][c] = '1'

for c, i in df['Q2'].iteritems():
    if i != '1':
        df['Q2'][c] = '0'

#third column
for c, i in df['Q3'].iteritems():
    if i == 'yes':
        df['Q3'][c] = '1'
    else:
        df['Q3'][c] = '0'

#fourth column
for c, i in df['Q4'].iteritems():
    if i == '2020':
        df['Q4'][c] = '1'
    else:
        df['Q4'][c] = '0'

#fifth column
for c, i in df['Q5'].iteritems():
    if i == "":
        df['Q5'][c] = '1'
    else:
        df['Q5'][c] = '0'

print(df.head())

#start training
X = df[['Q1', 'Q2', 'Q3', 'Q4', 'Q5', 'Q6']]
y = df[['result']]

from sklearn import linear_model
regr = linear_model.LinearRegression()


from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split( X, y, test_size=0.2, random_state=4)

regr.fit(X_train, y_train)

#test
yhat= regr.predict(X_test)

print("Residual sum of squares: %.2f"
      % np.mean((yhat - y_test) ** 2))

# r2score
from sklearn.metrics import r2_score
print('Variance score: %.2f' % r2_score(y_test, yhat))
