from flask import Flask,render_template,request, redirect,url_for,jsonify
app = Flask(__name__)
from flaskext.mysql import MySQL
 
mysql = MySQL()
app = Flask(__name__)
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'flasklogin'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route('/')
def home():
    return redirect(url_for('index'))

@app.route('/signup',methods=['GET','POST'])
def addstudent():
    if request.method=='POST':
        connection = mysql.get_db()
        cursor = connection.cursor()
        studentrollno =request.form['rollno']
        studentname =request.form['name']
        studentemail =request.form['email']
        studentpassword =request.form['password']
        studentstandard =request.form['std']
        query="INSERT INTO students(rollno,name,email,password,standard) VALUES(%s,%s,%s,%s,%s)"
        cursor.execute(query,(studentrollno,studentname,studentemail,studentpassword,studentstandard))
        print(request.form)
        for i in range(1,int(request.form['std'])+1):
            per = str(studentstandard)+"percentage"+str(i)
            rem = str(studentstandard)+"remark"+str(i)
            grad = str(studentstandard)+"grade"+str(i)
            studentpercent = request.form[per]
            studentremark = request.form[rem]
            studentgrade = request.form[grad]
            query="INSERT IGNORE INTO results(rollno,email,standard,percent,remark,grade) VALUES(%s,%s,%s,%s,%s,%s)"
            cursor.execute(query,(studentrollno,studentemail,i,studentpercent,studentremark,studentgrade))
            print(i,studentpercent,studentremark,studentgrade)
            
        connection.commit()
        return redirect(url_for('index'))
    return render_template("signup.html")    

@app.route('/signin',methods=['GET','POST'])
def index():
    if request.method=='POST':
        connection = mysql.get_db()
        cursor = mysql.connect().cursor()
        query="SELECT * from students where email= %s;"
        cursor.execute(query,(request.form['email']))
        userdata = cursor.fetchall()
        for student in userdata:
            if (student[2]==request.form['email']) and (student[3]==request.form['password']):
                queryEmail ="SELECT * from results where email= %s;"
                cursor.execute(queryEmail,(request.form['email']))
                data = cursor.fetchall()
                return render_template("dashboard.html", data=data,user=userdata)
    return render_template("signin.html")



if __name__ == '__main__':
   app.run(debug = True)
