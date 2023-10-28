import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
# расположение файлов
мой_файл = "data.csv"
моф_файл_вывод = "result.csv"

#_____________________________ ЗАГРУЗКА ДАННЫХ _____________________________#
# загрузить файл, разделитьель ; обозночает что записи разделены калнками (читай csv как текстовый файл)
данные_моего_файла = pd.read_csv(мой_файл, encoding = "Windows-1251", sep=';') #(мой_файл, encoding = "Windows-1251", sep=';')

#____________________________ ПОДГОТОВКА ДАННЫХ ____________________________#
dataset = данные_моего_файла
#исключение незначимых полей
dataset = dataset.drop(['код вокансии', 'телефон', 'почта', 'вк', 'id пользователя', 'требования работадателя', 'начало работы', 'конец работы'], axis=1)
#print(dataset.axes) # проверка полученных колонок

# Перевод строковых данных в категории
dataset['адресс организации'] = dataset['адресс организации'].astype('category')
dataset['название организация'] = dataset['название организация'].astype('category')
dataset['специальность'] = dataset['специальность'].astype('category')
# print(dataset.dtypes) # проверка
# Назначение данными кодов категорий
dataset['адресс организации'] = dataset['адресс организации'].cat.codes
dataset['название организация'] = dataset['название организация'].cat.codes
dataset['специальность'] = dataset['специальность'].cat.codes
#print(dataset)

# Данные для обучения
x_train = dataset[dataset['код института']!=0]
y_train = x_train['код института']
x_train = x_train.drop('код института', axis=1)

# Распределяемые данные
x_test = dataset[dataset['код института']==0]
y_test = x_test['код института']
x_test = x_test.drop('код института', axis=1)

#________________________________ Обучение _________________________________#
from sklearn.tree import DecisionTreeClassifier
classifier = DecisionTreeClassifier()
classifier.fit(x_train, y_train)

# анализ проверяемых данных
y_pred = classifier.predict(x_test)
i = 0
for it in y_test.index:
	данные_моего_файла['код института'][it] = y_pred[i]
	i=i+1
#print(данные_моего_файла) вывод итогового фала
данные_моего_файла.to_csv(моф_файл_вывод, encoding = "Windows-1251", sep=';')

