from pymongo import MongoClient

cluster = ("mongodb+srv://admin:t04fqfGWPPOqkcLE@cluster0.4uzhlus.mongodb.net/pytech?retryWrites=true&w=majority")
client = MongoClient(cluster)

db = client.pytech

print(db.list_collection_names())














