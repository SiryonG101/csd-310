from pymongo import MongoClient

cluster = ("mongodb+srv://admin:hFjgBtvLcJC40Kgm@cluster0.4uzhlus.mongodb.net/pytech?retryWrites=true&w=majority")
client = MongoClient(cluster)

db = client.pytech

collection = db.students

print("-- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")
students = collection.find()
for student in students:
    print("Student ID: " + str(student["student_id"]))
    print("First Name: " + student["first_name"])
    print("Last Name: " + student["last_name"])
    print()

result = db.collection.update_one({"student_id": 1007}, {"$set": {"last_name": "George"}})

print("-- DISPLAYING STUDENT DOCUMENT 1007 --")
for student in collection.find({"student_id": 1007}):
    print("Student ID: " + str(student["student_id"]))
    print("First Name: " + student["first_name"])
    print("Last Name: " + student["last_name"])
    print()












    





