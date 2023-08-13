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

student_4 = {
    "student_id": 1010,
    "first_name": "Mary",
    "last_name": "Freeman"
}

student_4_id = db.students.insert_one(student_4).inserted_id
print("-- INSERT STATEMENTS --")
print("Inserted student record into the students collection with document_id " + str(student_4_id))
print()
print("-- DISPLAYING STUDENT TEST DOC --")
student = collection.find_one({"student_id": 1010})
print("Student ID: " + str(student["student_id"]))
print("First Name: " + student["first_name"])
print("Last Name: " + student["last_name"])
print()

collection.delete_one({"student_id": 1010})
print()

print("-- DISPLAYING STUDENTS DOCUMENT FROM find() QUERY --")
students = collection.find()
for student in students:
    print("Student ID: " + str(student["student_id"]))
    print("First Name: " + student["first_name"])
    print("Last Name: " + student["last_name"])
    print()







