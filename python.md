# Основные термины в Python 🐍

-------------------------------

### *1. Функция (Function)*

**Функция** — это блок кода, который выполняется только при его вызове. В функцию можно передавать данные (аргументы) и возвращать результат.

Пример:

```python

def add(a, b):  # Определение функции
    return a + b

result = add(3, 4)  # Вызов функции, result = 7
```

### 2. *Метод (Method)*

**Метод** — это функция, которая принадлежит объекту. В Python методы определяются внутри класса и предназначены для работы с данными (атрибутами) экземпляра этого класса.

Пример:
```python

class Dog:
    def bark(self):  # Метод bark
        print("Woof!")

dog = Dog()
dog.bark()  # Вызов метода у экземпляра класса
```

### *3. Класс (Class)*

**Класс** — это шаблон для создания объектов. Класс определяет атрибуты (данные) и методы (функции), которые будут у объектов, созданных на его основе.

Пример:
```python

class Car:
    def __init__(self, brand, model):
        self.brand = brand  # Атрибут экземпляра
        self.model = model

    def drive(self):  # Метод экземпляра
        print(f"{self.brand} {self.model} is driving")

my_car = Car("Toyota", "Camry")  # Создание экземпляра класса
my_car.drive()  # Вызов метода
```
### 4. *Конструктор (Constructor)*

**Конструктор** — это специальный метод, который вызывается при создании экземпляра класса. В Python конструктор называется __init__. Он используется для инициализации атрибутов объекта.

Пример:
```python

class Person:
    def __init__(self, name, age):  # Конструктор
        self.name = name
        self.age = age

person = Person("Alice", 30)  # Создание объекта, вызывается __init__
```
### *5. Экземпляр (Instance)*

*Экземпляр* — это конкретный объект, созданный на основе класса. У каждого экземпляра есть свои атрибуты, которые могут быть уникальными.

Пример:
```python

class Cat:
    def __init__(self, name):
        self.name = name

cat1 = Cat("Whiskers")  # Экземпляр 1
cat2 = Cat("Mittens")   # Экземпляр 2
```

### *6. Атрибут (Attribute)*

**Атрибут** — это переменная, которая принадлежит объекту (экземпляру) или классу. Атрибуты экземпляра определяются в конструкторе (через self), а атрибуты класса — на уровне класса.

Пример:
```python

class Student:
    school = "High School"  # Атрибут класса

    def __init__(self, name):
        self.name = name    # Атрибут экземпляра

print(Student.school)  # Доступ к атрибуту класса
student = Student("Bob")
print(student.name)    # Доступ к атрибуту экземпляра
```

### *7. Наследование (Inheritance)*

**Наследование** - позволяет создавать новый класс на основе существующего. Новый класс (дочерний) наследует атрибуты и методы родительского класса.

Пример:
```python

class Animal:
    def eat(self):
        print("Eating...")

class Dog(Animal):  # Dog наследует Animal
    def bark(self):
        print("Woof!")

dog = Dog()
dog.eat()   # Унаследованный метод
dog.bark()  # Собственный метод
```

### *8. Полиморфизм (Polymorphism)*

**Полиморфизм** - позволяет использовать объекты разных классов с одинаковым интерфейсом. В Python полиморфизм достигается за счет того, что методы с одинаковыми именами могут быть в разных классах.

Пример:
```python

class Cat:
    def sound(self):
        return "Meow"

class Dog:
    def sound(self):
        return "Woof"

def make_sound(animal):
    print(animal.sound())

cat = Cat()
dog = Dog()

make_sound(cat)  # Meow
make_sound(dog)  # Woof
```

### *9. Инкапсуляция (Encapsulation)*

**Инкапсуляция** — это скрытие внутренней реализации объекта и предоставление доступа только через публичные методы. В Python инкапсуляция достигается с помощью соглашений об именовании (например, _protected, __private).

Пример:
```python

class BankAccount:
    def __init__(self, balance):
        self.__balance = balance  # Приватный атрибут

    def deposit(self, amount):
        self.__balance += amount

    def get_balance(self):
        return self.__balance

account = BankAccount(1000)
account.deposit(500)
print(account.get_balance())  # 1500
# print(account.__balance)    # Ошибка: атрибут приватный
```

### *10. Декоратор (Decorator)*

**Декоратор** — это функция, которая принимает другую функцию и расширяет ее функциональность без изменения кода самой функции.

Пример:
```python

def my_decorator(func):
    def wrapper():
        print("Something before the function.")
        func()
        print("Something after the function.")
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")

say_hello()
# Something before the function.
# Hello!
# Something after the function.
```
### *11. Генератор (Generator)*

**Генератор** — это функция, которая возвращает итератор. Она использует ключевое слово yield для возврата значений по одному, сохраняя состояние между вызовами.

Пример:
```python

def count_up_to(n):
    i = 1
    while i <= n:
        yield i
        i += 1

for number in count_up_to(5):
    print(number)  # 1, 2, 3, 4, 5
```

### *12. Итератор (Iterator)*

**Итератор** — это объект, который позволяет перебирать элементы коллекции. Он должен иметь методы __iter__() и __next__().

Пример:
```python

class MyIterator:
    def __init__(self, data):
        self.data = data
        self.index = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.index >= len(self.data):
            raise StopIteration
        value = self.data[self.index]
        self.index += 1
        return value

iterator = MyIterator([1, 2, 3])
for item in iterator:
    print(item)  # 1, 2, 3
```

### *13. Контекстный менеджер (Context Manager)*

**Контекстный менеджер** — это объект, который определяет методы __enter__ и __exit__ для управления контекстом выполнения (например, автоматическое закрытие файла).

Пример:
```python

with open('file.txt', 'r') as f:  # open возвращает контекстный менеджер
    content = f.read()
# Файл автоматически закрывается после выхода из блока with

14. Модуль (Module)

**Модуль** — это файл с расширением .py, содержащий код на Python (функции, классы, переменные). Модули используются для организации кода.

Пример:

```python

# math_module.py
def add(a, b):
    return a + b

# main.py
import math_module
result = math_module.add(2, 3)
```

### *15. Пакет (Package)*

**Пакет** — это способ организации модулей в пространстве имен. Пакет — это каталог, содержащий файл __init__.py и другие модули или подпакеты.

Пример:
```bash
text

my_package/
    __init__.py
    module1.py
    module2.py
```

### *16. Исключение (Exception)*

**Исключение** — это событие, которое происходит во время выполнения программы и нарушает нормальный ход выполнения. Исключения могут быть обработаны с помощью try/except.

Пример:
python

try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero!")

### *17. Лямбда-функция (Lambda Function)*

Лямбда-функция — это анонимная функция, которая может содержать только одно выражение.

Пример:
```python

add = lambda a, b: a + b
print(add(3, 4))  # 7
```

### *18. Замыкание (Closure)*

**Замыкание** — это функция, которая запоминает значения из охватывающей области видимости, даже если эта область видимости больше не существует.

Пример:
```python

def outer_function(x):
    def inner_function(y):
        return x + y
    return inner_function

closure = outer_function(10)
print(closure(5))  # 15
```

### *19. Дескриптор (Descriptor)*

Дескриптор — это объект, который определяет методы __get__, __set__ или __delete__ и позволяет управлять доступом к атрибутам другого класса.

Пример:
```python

class Descriptor:
    def __get__(self, obj, objtype=None):
        return 42

class MyClass:
    attr = Descriptor()

obj = MyClass()
print(obj.attr)  # 42
```

### *20. Метакласс (Metaclass)*

**Метакласс** — это класс, экземпляры которого являются классами. Мета классы позволяют управлять созданием классов.

Пример:
```python

class Meta(type):
    def __new__(cls, name, bases, dct):
        dct['added_by_meta'] = 100
        return super().__new__(cls, name, bases, dct)

class MyClass(metaclass=Meta):
    pass

print(MyClass.added_by_meta)  # 100
```
### *21. Абстракция (Abstraction)*

Аналогия: Руль автомобиля — вы знаете, как им управлять, но не знаете, как именно он поворачивает колёса.
python

```python
from abc import ABC, abstractmethod

# Абстрактный класс - определяет интерфейс
class Shape(ABC):
    @abstractmethod
    def area(self):
        """Должен быть реализован в дочерних классах"""
        pass
    
    @abstractmethod
    def perimeter(self):
        pass

# Конкретные реализации
class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    def area(self):
        return self.width * self.height
    
    def perimeter(self):
        return 2 * (self.width + self.height)

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius
    
    def area(self):
        return 3.14 * self.radius ** 2
    
    def perimeter(self):
        return 2 * 3.14 * self.radius

# Использование
shapes = [Rectangle(4, 5), Circle(3)]

for shape in shapes:
    print(f"Площадь: {shape.area()}")  # Единый интерфейс
    print(f"Периметр: {shape.perimeter()}")
```    
----------------------------------
|Термин |	Что делает	| Пример |
|-------|---------------|--------|
|Функция| Выполняет задачу | len([1,2,3])|
|Метод | Функция объекта	| "hello".upper()|
|Класс | Шаблон объектов	| class User:|
|Объект | Экземпляр класса | user = User()|
|Конструктор| Инициализирует объект| __init__|
|Атрибут | Данные объекта| user.name|
|Модуль| Файл с кодом | import os|
|Пакет| Папка с модулями	| from django import forms|
|Декоратор |	Обёртка для функции | @staticmethod|
|Генератор |	Создаёт последовательность | yield x|
|Итератор |Перебирает элементы |	for x in [1,2,3]|

------------------------------------------------------
# 🐍 **Типы данных в Python**
### *Классификация типов данных*

### **По изменяемости (Mutability):**
- **Изменяемые (Mutable):** Можно менять после создания
- **Неизменяемые (Immutable):** Нельзя менять после создания

### **По структуре:**
- **Простые (Scalar):** Одно значение
- **Составные (Compound):** Множество значений

---

### 🔢 **1. ЧИСЛОВЫЕ ТИПЫ (Numeric Types)**

### **int (целые числа)**
```python
# Целые числа любой длины
x = 10           # Десятичное
y = 0b1010       # Двоичное (10 в десятичной)
z = 0o12         # Восьмеричное (10 в десятичной)
w = 0xA          # Шестнадцатеричное (10 в десятичной)

print(type(x))   # <class 'int'>
print(10 ** 100) # Большие числа поддерживаются
```

### **float (числа с плавающей точкой)**
```python
f1 = 3.14
f2 = 2.0
f3 = 1.5e-3      # Научная нотация: 0.0015
f4 = float('inf') # Бесконечность
f5 = float('nan') # Не число (Not a Number)

# Особенности float
print(0.1 + 0.2 == 0.3)  # False! (из-за погрешности)
print(f"{0.1 + 0.2:.17f}")  # 0.30000000000000004
```

### **complex (комплексные числа)**
```python
c1 = 3 + 4j      # j для мнимой части
c2 = complex(2, -5)  # 2 - 5j

print(c1.real)   # 3.0 (действительная часть)
print(c1.imag)   # 4.0 (мнимая часть)
print(c1.conjugate())  # 3 - 4j (сопряжённое)
```

| Тип | Изменяемость | Пример | Особенности |
|-----|--------------|--------|-------------|
| **int** | ❌ Immutable | `42` | Бесконечная точность |
| **float** | ❌ Immutable | `3.14` | IEEE 754, погрешности |
| **complex** | ❌ Immutable | `3+4j` | Для математики |

---

### 🔤 **2. ТЕКСТОВЫЕ ТИПЫ (Text Types)**

### **str (строки)**
```python
# Создание строк
s1 = 'одинарные кавычки'
s2 = "двойные кавычки"
s3 = '''многострочные
строки'''
s4 = """ещё многострочные"""

# Специальные символы
s5 = "Первая строка\nВторая строка"
s6 = r"C:\Users\Name"  # Сырая строка (raw)
s7 = f"Значение: {x}"  # f-строка (форматированная)

# Операции со строками
text = "Python"
print(text[0])      # 'P' (индексация)
print(text[1:4])    # 'yth' (срезы)
print(len(text))    # 6 (длина)
print("Py" in text) # True (проверка вхождения)

# Методы строк
print("hello".upper())      # "HELLO"
print("HELLO".lower())      # "hello"
print(" python ".strip())   # "python"
print("a,b,c".split(","))   # ['a', 'b', 'c']
print("-".join(["a", "b"])) # "a-b"
```

| Свойство | str |
|----------|-----|
| **Изменяемость** | ❌ Immutable |
| **Индексация** | ✅ Есть |
| **Срезы** | ✅ Есть |
| **Итерируемость** | ✅ Есть |

---

### 📋 **3. ПОСЛЕДОВАТЕЛЬНОСТИ (Sequences)**

### **list (список) - ИЗМЕНЯЕМЫЙ**
```python
# Создание списка
lst = [1, 2, 3, "hello", 3.14, [4, 5]]
lst2 = list(range(5))  # [0, 1, 2, 3, 4]
lst3 = [i**2 for i in range(5)]  # Генератор списка

# Изменение списка
lst.append(100)        # Добавить в конец
lst.insert(1, "new")   # Вставить по индексу
lst.remove(2)          # Удалить первое вхождение
popped = lst.pop()     # Удалить и вернуть последний
lst[0] = "changed"     # Изменить элемент

# Операции
print(lst + [7, 8])    # Конкатенация
print([1, 2] * 3)      # Повторение
print(3 in lst)        # Проверка вхождения

# Сортировка
nums = [3, 1, 4, 1, 5]
nums.sort()            # [1, 1, 3, 4, 5]
sorted_nums = sorted(nums, reverse=True)
```

### **tuple (кортеж) - НЕИЗМЕНЯЕМЫЙ**
```python
# Создание кортежа
tup = (1, 2, 3)
tup2 = 1, 2, 3         # Скобки не обязательны
tup3 = (42,)           # Кортеж из одного элемента (запятая!)
tup4 = tuple([1, 2, 3]) # Из списка

# Операции (только чтение)
print(tup[0])          # 1
print(tup[1:])         # (2, 3)
print(2 in tup)        # True
print(len(tup))        # 3

# Нельзя изменять!
# tup[0] = 100  # ОШИБКА! TypeError

# Распаковка кортежа
a, b, c = tup          # a=1, b=2, c=3
x, *rest = tup         # x=1, rest=[2, 3]

# Использование: когда нужна неизменяемая последовательность
coordinates = (10.5, 20.3)
rgb = (255, 0, 0)
```

### **range (диапазон) - НЕИЗМЕНЯЕМЫЙ**
```python
# Создание диапазона
r1 = range(5)           # 0, 1, 2, 3, 4
r2 = range(1, 10, 2)    # 1, 3, 5, 7, 9
r3 = range(10, 0, -1)   # 10, 9, 8, ..., 1

# Использование
print(list(r1))         # [0, 1, 2, 3, 4]
for i in range(3):
    print(i)            # 0, 1, 2

# Экономия памяти
import sys
print(sys.getsizeof(list(range(1000))))  # ~9024 байт
print(sys.getsizeof(range(1000)))        # ~48 байт
```

| Свойство | list | tuple | range |
|----------|------|-------|-------|
| **Изменяемость** | ✅ Mutable | ❌ Immutable | ❌ Immutable |
| **Индексация** | ✅ | ✅ | ✅ |
| **Изменение элементов** | ✅ | ❌ | ❌ |
| **Добавление элементов** | ✅ | ❌ | ❌ |
| **Удаление элементов** | ✅ | ❌ | ❌ |
| **Использование памяти** | Больше | Меньше | Минимальное |
| **Использование** | Изменяемая коллекция | Константы, ключи словаря | Циклы, индексы |

---

### 🗂️ **4. МНОЖЕСТВА (Sets)**

### **set (множество) - ИЗМЕНЯЕМОЕ**
```python
# Создание множества
s1 = {1, 2, 3, 3, 2}      # {1, 2, 3} (дубли удаляются!)
s2 = set([1, 2, 3, 3])    # {1, 2, 3}
s3 = set("hello")         # {'h', 'e', 'l', 'o'}

# Изменение множества
s1.add(4)                 # Добавить элемент
s1.update([5, 6, 7])      # Добавить несколько
s1.remove(2)              # Удалить элемент (ошибка если нет)
s1.discard(100)           # Удалить если есть (без ошибки)
popped = s1.pop()         # Удалить случайный элемент

# Операции с множествами
A = {1, 2, 3}
B = {3, 4, 5}

print(A | B)   # Объединение: {1, 2, 3, 4, 5}
print(A & B)   # Пересечение: {3}
print(A - B)   # Разность: {1, 2}
print(A ^ B)   # Симметричная разность: {1, 2, 4, 5}

# Проверки
print(1 in A)            # True
print(A.issubset(B))     # False
print(A.isdisjoint({4,5})) # True (нет общих элементов)
```

### **frozenset (неизменяемое множество)**
```python
fs = frozenset([1, 2, 3])
# fs.add(4)  # ОШИБКА! AttributeError

# Использование: ключи в словарях
valid_dict = {frozenset([1, 2]): "value"}
# {set([1, 2]): "value"}  # ОШИБКА! set нельзя использовать как ключ
```

| Свойство | set | frozenset |
|----------|-----|-----------|
| **Изменяемость** | ✅ Mutable | ❌ Immutable |
| **Дубликаты** | ❌ Автоматически удаляются | ❌ Автоматически удаляются |
| **Порядок** | ❌ Нет гарантии порядка (Python 3.7+ сохраняет) | ❌ Нет гарантии порядка |
| **Хешируемость** | ❌ Нельзя использовать как ключ словаря | ✅ Можно использовать как ключ |
| **Использование** | Уникальные элементы, операции над множествами | Ключи словарей, константные множества |

---

### 🗂️ **5. СЛОВАРИ (Mappings)**

### **dict (словарь)**
```python
# Создание словаря
d1 = {"key1": "value1", "key2": "value2"}
d2 = dict(key1="value1", key2="value2")
d3 = dict([("key1", "value1"), ("key2", "value2")])
d4 = {x: x**2 for x in range(5)}  # Генератор словаря

# Доступ и изменение
d1["key3"] = "value3"    # Добавить/изменить
value = d1.get("key1")   # Получить (без ошибки если нет)
value = d1["key1"]       # Получить (ошибка если нет)
del d1["key1"]           # Удалить
popped = d1.pop("key2")  # Удалить и вернуть значение

# Методы словаря
keys = d1.keys()         # Ключи
values = d1.values()     # Значения
items = d1.items()       # Пары (ключ, значение)

# Итерация
for key in d1:
    print(key, d1[key])

for key, value in d1.items():
    print(key, value)

# Новое в Python 3.9+: объединение словарей
d5 = d1 | d2  # Объединение
d1 |= d2      # Обновление на месте
```

| Свойство | dict |
|----------|------|
| **Изменяемость** | ✅ Mutable |
| **Ключи** | Любые хешируемые типы (immutable) |
| **Значения** | Любые типы |
| **Порядок** | ✅ Сохраняет порядок добавления (Python 3.7+) |
| **Поиск** | ✅ O(1) в среднем |
| **Хешируемость** | ❌ Нельзя использовать как ключ другого словаря |

---

### 🔤 **6. БИНАРНЫЕ ТИПЫ (Binary Types)**

### **bytes (неизменяемые байты)**
```python
b1 = b"hello"           # Байтовая строка
b2 = bytes([65, 66, 67]) # b'ABC'
b3 = bytes("привет", encoding="utf-8")

print(b1[0])            # 104 (код 'h')
# b1[0] = 65  # ОШИБКА! bytes неизменяемый
```

### **bytearray (изменяемые байты)**
```python
ba = bytearray(b"hello")
ba[0] = 65              # Можно изменять!
print(ba)               # b'Aello'

ba.append(33)           # Добавить байт
ba.extend(b"!!")        # Добавить несколько
```

### **memoryview (представление памяти)**
```python
data = bytearray(b"abcdef")
mv = memoryview(data)

print(mv[0])            # 97
print(bytes(mv[1:3]))   # b'bc'

# Эффективная работа с большими данными
large_data = bytearray(1000000)
mv = memoryview(large_data)
partial = mv[5000:6000]  # Без копирования данных!
```

| Тип | Изменяемость | Использование |
|-----|--------------|---------------|
| **bytes** | ❌ Immutable | Бинарные данные, файлы |
| **bytearray** | ✅ Mutable | Изменяемые бинарные данные |
| **memoryview** | Зависит | Эффективный доступ к памяти |

---

### ✅ **7. БУЛЕВЫЙ ТИП (Boolean)**

### **bool (логический тип)**
```python
t = True
f = False

# Преобразование к bool
print(bool(0))      # False
print(bool(42))     # True
print(bool(""))     # False
print(bool("hi"))   # True
print(bool([]))     # False
print(bool([1]))    # True
print(bool(None))   # False

# Логические операции
print(True and False)  # False
print(True or False)   # True
print(not True)        # False
```

**Falsy значения** (преобразуются в False):
- `False`
- `None`
- `0`, `0.0`, `0j`
- Пустые коллекции: `""`, `[]`, `()`, `{}`, `set()`
- Объекты с `__len__()` возвращающим 0

**Truthy значения**: всё остальное

---

## 🌀 **8. NoneType**

### **None (отсутствие значения)**
```python
value = None  # Пустое значение

# Использование
def find_item(items, target):
    for item in items:
        if item == target:
            return item
    return None  # Значение по умолчанию при отсутствии

# Проверка на None
if value is None:  # Важно: использовать 'is', а не '=='
    print("Значение отсутствует")

# None в сравнениях
print(None == None)   # True
print(None is None)   # True
print(None == False)  # False
```

---

###  **9. ТИПЫ ДЛЯ РАБОТЫ С ФАЙЛАМИ**

### **file (объект файла)**
```python
# Открытие файла возвращает file object
file = open("test.txt", "r")
print(type(file))  # <class '_io.TextIOWrapper'>

# Методы
content = file.read()
lines = file.readlines()
file.write("text")
file.close()

# Контекстный менеджер (рекомендуется)
with open("test.txt", "r") as f:
    content = f.read()
# Файл автоматически закрывается
```

---

## 🔄 **10. ПРИВЕДЕНИЕ ТИПОВ (Type Casting)**

```python
# Явное преобразование
int("42")           # 42
float("3.14")       # 3.14
str(100)            # "100"
list("hello")       # ['h', 'e', 'l', 'l', 'o']
tuple([1, 2, 3])    # (1, 2, 3)
set([1, 1, 2])      # {1, 2}
dict([(1, 'a'), (2, 'b')])  # {1: 'a', 2: 'b'}

# Особые случаи
int(3.99)           # 3 (отбрасывает дробную часть)
int("1010", 2)      # 10 (из двоичной строки)
list({1: 'a', 2: 'b'})  # [1, 2] (только ключи)
```

---

### 📊 *СРАВНИТЕЛЬНАЯ ТАБЛИЦА ТИПОВ ДАННЫХ*

| Тип | Категория | Изменяемость | Пример | Хешируемость |
|-----|-----------|--------------|--------|--------------|
| **int** | Числовой | ❌ Immutable | `42` | ✅ |
| **float** | Числовой | ❌ Immutable | `3.14` | ✅ |
| **complex** | Числовой | ❌ Immutable | `3+4j` | ✅ |
| **str** | Текст | ❌ Immutable | `"hello"` | ✅ |
| **bool** | Логический | ❌ Immutable | `True` | ✅ |
| **bytes** | Бинарный | ❌ Immutable | `b"data"` | ✅ |
| **list** | Последовательность | ✅ Mutable | `[1, 2, 3]` | ❌ |
| **tuple** | Последовательность | ❌ Immutable | `(1, 2, 3)` | ✅ |
| **range** | Последовательность | ❌ Immutable | `range(5)` | ✅ |
| **set** | Множество | ✅ Mutable | `{1, 2, 3}` | ❌ |
| **frozenset** | Множество | ❌ Immutable | `frozenset([1,2])` | ✅ |
| **dict** | Отображение | ✅ Mutable | `{"a": 1}` | ❌ |
| **bytearray** | Бинарный | ✅ Mutable | `bytearray(b"data")` | ❌ |
| **NoneType** | Специальный | ❌ Immutable | `None` | ✅ |

---

### 🧪 *ПРОВЕРКА ТИПОВ И АТРИБУТЫ*

```python
# Проверка типа
x = 42
print(type(x))                # <class 'int'>
print(isinstance(x, int))     # True
print(isinstance(x, (int, float)))  # True (один из)

# Атрибуты типа
print(int.__name__)           # 'int'
print(str.__bases__)          # (<class 'object'>,)

# Аннотации типов (Python 3.5+)
def greet(name: str) -> str:
    return f"Hello, {name}"

from typing import List, Dict, Optional, Union

def process(data: List[Dict[str, Union[int, str]]]) -> Optional[int]:
    # Список словарей, где ключи - str, значения - int или str
    pass
```

---

### 🔧 *ОПЕРАЦИИ НАД РАЗНЫМИ ТИПАМИ*

### **Операторы сравнения**
```python
# Работают со многими типами
print(1 < 2)        # True (числа)
print("a" < "b")    # True (строки лексикографически)
print([1, 2] < [1, 3])  # True (списки поэлементно)

# Но нельзя сравнивать разные типы!
# print(1 < "2")  # TypeError
```

### **Операторы арифметики**
```python
print(10 + 5)       # 15
print("Hello" + " World")  # "Hello World" (конкатенация)
print([1, 2] + [3, 4])  # [1, 2, 3, 4]
print("Hi" * 3)     # "HiHiHi" (повторение)
print([0] * 5)      # [0, 0, 0, 0, 0]
```

### **Операторы принадлежности**
```python
print(2 in [1, 2, 3])    # True
print("ell" in "hello")  # True
print("key" in {"key": "value"})  # True (проверяет ключи)
```

---

## 🎯 **ВЫБОР ПРАВИЛЬНОГО ТИПА ДАННЫХ**

### **Когда использовать:**
- **list**: Изменяемая последовательность элементов
- **tuple**: Неизменяемая последовательность (координаты, константы)
- **set**: Уникальные элементы, операции над множествами
- **dict**: Пары ключ-значение, быстрый поиск по ключу
- **str**: Текст, строковые операции
- **int/float**: Математические вычисления

### **Производительность:**
```python
import timeit

# Поиск элемента
list_time = timeit.timeit('10000 in lst', 
                         setup='lst = list(range(100000))', 
                         number=1000)

set_time = timeit.timeit('10000 in s', 
                        setup='s = set(range(100000))', 
                        number=1000)

print(f"List: {list_time:.4f} сек")  # ~0.1 сек (O(n))
print(f"Set:  {set_time:.4f} сек")   # ~0.0001 сек (O(1))
```

---

## 💡 **ПРАКТИЧЕСКИЕ СОВЕТЫ**

1. **Используйте кортежи** для данных, которые не должны меняться
2. **Используйте множества** для удаления дубликатов
3. **Словари** — лучший выбор для поиска по ключу
4. **Проверяйте тип** при получении данных извне
5. **Не сравнивайте float напрямую** из-за погрешностей
6. **Используйте аннотации типов** для документации кода

*Это основные термины, которые помогут вам лучше понимать Python и общаться с другими разработчиками.*</br>
*Каждый из этих терминов имеет важное значение в объектно-ориентированном программировании и в Python в частности.*</br>
*Теперь вы готовы говорить о Python как настоящий разработчик! 🐍✨*</br>