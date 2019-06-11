from math import*

# # Imprimir en pantalla
# # El orden es tenido en cuenta
# print("Hello World")
#
# character_name = "John"
# character_age= "35"
# number=13.3694
# isMale=True
#
# print("Hi my names is "+character_name)
#
# #Cambiar de linea
# print("Hi my names is\nJona")
#
# phase = "Hola a todos "
#
# print (phase + "Contatenacion")
# print (phase.upper())
# print (phase.lower())
# print (phase.isupper())
# print (phase.upper().isupper())
# print (len(phase))
#
# #Imprime el string en la posición indicada
# print (phase[0])
# #Imprime la posición de un string - comienza en 0
# print (phase.index("t"))
#
# print (phase.replace("todos", "tod@s"))

################################################################ NUMBERS

# my_num = -5
# print(str(my_num)+ " my favorite number")
#
# #Valor absoluto
# print(abs(my_num))
#
# #Evalación
# print (pow(4,2))
#
# #Número Mayor
# print(max(5,10))
#
# #Múmero Menor
# print(min(5,10))
#
# #Redondear Números
# print(round(3.6))
#
# #Elevar
# print (ceil(3.2))
#
# #Disminuir
# print (floor(2.8))
#
# #Raíz Cuadrada
# print(sqrt(16))

################################################################ INPUT FROM USERS

# name = input("Enter your name: ")
# age = input("Enter your age: ")
# print("Hello " +name + "!" + age)

################################################################ BASIC CALCULATOR

#Hay que cambiar los numeros de string a number para pode operarlos
# num1= input("Enter a number: ")
# num2= input("Enter another number: ")
# result= float(num1)+float(num2)
#
# print(result)

################################################################ LISTS

#Index 0 - 1 - 2
# friends = ["Kevin", "Karen", "Jim"]
# print(friends[1:])
#
# friends = ["Kevin", "Karen", "Jim","Oscar","Toby"]
# print(friends[1:])
#
# friends = ["Kevin", "Karen", "Jim"]
# friends[1]

lucky_numbers = [4, 8, 15, 16, 23, 42]
friends = ["Kevin", "Karen", "Jim","Oscar","Toby","Karen"]
#friends.extend(lucky_numbers)

#End of the list
#friends.append("Creed")

#friends.insert(1,"Kelly")

#friends.remove("Jim")

#friends.clear()

#Remove the last element in the list
#friends.pop()

#Posición
#print(friends.index("Oscar"))

#print(friends.count("Karen"))

#friends.sort()

#lucky_numbers.reverse()

#friends2 = friends.copy()

#print(friends2)

################################################################ FUNCTIONS

#def para usar funciones en minuscula y guion bajo para separar las palabras

# def  say_hi(name, age):
#     print("Hello: " + name+ ", you are: "+age)
#
# say_hi("Mike", "35")
# say_hi("Jona", "40")

#Return Function
# def cube(num):
#     return num*num*num
#
# result = cube(4)
# print(result)

################################################################ IF STATEMENTS (Declaraciones)

# is_male= 0
# is_tall=0
#
# if is_male and is_tall:
#     print("You are a tall male")
# elif is_male and not(is_tall):
#     print("You are a short male")
# elif not(is_male) and is_tall:
#     print("You are are not a male but are tall")
# else:
#     print("You are not a male and not a tall")


# == Equal != Different
# def max_num (num1, num2, num3):
#     if num1 >= num2 and num1 >= num3:
#         return num1
#     elif num2 >= num1 and num2 >= num3:
#         return num2
#     else:
#         return num3
#
# print(max(-3,4,5))

################################################################ ADVANCE CALCULATOR

#Hay que cambiar los numeros de string a number para pode operarlos
# num1= float(input("Enter first number: "))
# op = input("Enter operation: ")
# num2= float(input("Enter second number: "))
#
# if op == "+":
#     print(num1 + num2)
# elif op == "-":
#     print(num1 - num2)
# elif op == "/":
#     print(num1 / num2)
# elif op == "*":
#     print(num1 * num2)
# else:
#     print("Invalid operator")

################################################################ DICTIONARIES (STORE INFORMATION)

# monthConversions={
#     "Jan": "January",
#     "Feb": "February",
#     "Mar": "March",
#     "Apr": "April",
#     "May": "May",
#     "Jun": "June",
#     "Jul": "July",
#     "Aug": "August",
#     "Sep": "September",
#     "Oct": "October",
#     "Nov": "November",
#     "Dec": "December",
# }
#
# #Access
# print(monthConversions["Mar"])
# print(monthConversions.get("Luv", "Not a valid Key"))


################################################################ WHILE LOOP

# i=1
#
# while i<=10:
#     print(i)
#     i += 1
#
# print("Done with loop")


################################################################ BUILDING A GUESSING GAME
#As long as -- mientras


# secret_word = "giraffe"
# guess=""
# guess_cont  = 0
# guess_limit = 3
# out_of_guesses = False
#
# while guess != secret_word and not(out_of_guesses):
#     if guess_cont < guess_limit:
#         guess=input("Enter guess: ")
#         guess_cont += 1
#     else:
#         out_of_guesses=True
#
# if out_of_guesses:
#     print("Out of Guesses, YOU LOSE!")
# else:
#     print("YOU WIN!")


################################################################ FOR LOOP

#Each time it has a different value in the collection I wana do something

# friends = ["Jim", "Karen", "Kevin"]
# for friend in friends:
#     print(friend)
#
# for index in range(3,10):
#     print(index)
#
# for index in range(5):
#     if index==0:
#         print("First iteration")
#     else:
#         print("Not First")

################################################################ EXPONENT FUNCTION

# def raise_to_power(base_num, pow_num):
#     result = 1
#     for index in range(pow_num):
#         result = result * base_num
#     return result
#
# print(raise_to_power(2,3))

################################################################ 2D Lists & Nested Loops

# number_grid=[
#     [1, 2, 3],
#     [4, 5, 6],
#     [7, 8, 9],
#     [0]
# ]
#
# print(number_grid[2][1])
#
# for row in number_grid:
#     for col in row:
#         print(col)

################################################################ Build a translator

# def translate(phrase):
#     translation= ""
#     for letter in phrase:
#         if letter.lower() in "aeiou":
#             if letter.isupper():
#                 translation= translation+"G"
#             else:
#                 translation = translation + "g"
#         else:
#             translation= translation + letter
#     return translation
#
# print(translate(input("Enter a phrase: ")))

################################################################ Commments

#Comment
#print ("Comments are fun")

################################################################ Try / Except -- Use the especific error
# try:
#     answer= 10/0
#     number = int(input("Enter a Number: "))
#     print(number)
# except ZeroDivisionError as err:
#     print(err)
# except ValueError:
#     print("Invalid input")

################################################################ Reading Files r-red w-write a-append r+read and write

# employee_file = open("employees.txt", "r")
#
# for employee in employee_file.readlines():
#         print(employee)

#print(employee_file.readable())
#print(employee_file.read())
#print(employee_file.readline())
#print(employee_file.readlines()[0])

#employee_file.close()

################################################################ Writing in files

# employee_file = open("employees.txt", "a")
# #print(employee_file.writable())
# print(employee_file.write("\nMaira - QA"))
# employee_file.close()

# employee_file = open("employees1.txt", "w") ##crea un nuevo archivo
# print(employee_file.write("\nMaira - QA"))

################################################################ Modules and Pip

#Llamar otros archivos (External File)
#Los modulos son almanceados en la carpeta Lib
#External Libraries ->Phyton 3.7 -> Lib
#En la página de python dice en que carpeta esta descargada la libreria
#PIP package manager !!
#Para instalar paquetes externos sse hace a través de la consola, con el pip comando
#Queda instalado en la carpeta site-packages
#Para usarlo se coloca con el nombre y punto
#Para desinstalar pip uninstall y el nombre del paqeute o libreria
import useful_tools

print(useful_tools.roll_dice(10))

################################################################ Classes and Objects













