import os
from flask import Flask, render_template, request, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import check_password_hash, generate_password_hash
from datetime import datetime

from werkzeug.utils import secure_filename

current_dir = os.path.dirname(os.path.realpath(__file__))

app = Flask(__name__)
app.config['SECRET_KEY'] = 'hjshjhdjah kjshkjdhjs'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(current_dir, "database.db")
app.config["images"] = "static/uploads"
db = SQLAlchemy(app)
db.init_app(app)
app.app_context().push()


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(80), unique=True)
    password = db.Column(db.String(120))
    name = db.Column(db.String(120))


class admin_data(db.Model):
    admin_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(80), unique=True)
    name = db.Column(db.String(80), unique=True)
    password = db.Column(db.String(120))

class Event(db.Model):
    __tablename__ = 'Event'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(80), unique=True)
    place = db.Column(db.String(120))
    """
    image = db.Column(db.String(100), nullable=False)
    """
    capacity = db.Column(db.Integer)
    show_date = db.Column(db.String(10))
    organizer_phone=db.Column(db.Integer)
    event_desc=db.Column(db.String(120))
    event_type=db.Column(db.String(120))
    event_loc=db.Column(db.String(120))
    event_status=db.Column(db.String(120))

class Participants(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(80), unique=True)
    part_name = db.Column(db.String(80), unique=True)
    event_id = db.Column(db.Integer, db.ForeignKey("Event.id"), nullable=False)
    part_phone = db.Column(db.Integer)
    show_date = db.Column(db.String(10))
    seats=db.Column(db.Integer)


db.create_all()

user1 = admin_data.query.filter_by(email="chandudasari2913@gmail.com").first()
if not user1:
    new_user = admin_data(email="chandudasari2913@gmail.com", name="chandu", password=generate_password_hash("Chandudasari1#", method='sha256'))
    db.session.add(new_user)
    db.session.commit()


@app.route('/')
def index():
    return render_template("index.html")


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method=="GET":
        render_template("index.html")
    elif request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        user = User.query.filter_by(email=email).first()
        if user:
            if check_password_hash(user.password, password):
                return redirect(url_for('home'))
            else:
                flash('Incorrect password, try again.', category='error')
        else:
            flash('Email does not exist.', category='error')

    return render_template("index.html")

@app.route('/adminlogin', methods=['GET', 'POST'])
def adminlogin():
    if request.method=="GET":
        render_template("admin.html")
    elif request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        user = admin_data.query.filter_by(email=email).first()
        if user:
            if check_password_hash(user.password, password):
                return redirect(url_for('adminmanage'))
            else:
                flash('Incorrect password, try again.', category='error')
        else:
            flash('Email does not exist.', category='error')

    return render_template("admin.html")
@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        email = request.form.get('email')
        name = request.form.get('name')
        password= request.form.get('password')
        Confirm_password = request.form.get('Confirm_password')

        user = User.query.filter_by(email=email).first()
        if user:
            flash('Email already exists.', category='error')
        elif len(email) < 4:
            flash('Email must be greater than 3 characters.', category='error')
        elif len(name) < 2:
            flash('First name must be greater than 1 character.', category='error')
        elif password != Confirm_password:
            flash('Passwords don\'t match.', category='error')
        elif len(password) < 7:
            flash('Password must be at least 7 characters.', category='error')
        else:
            new_user = User(email=email, name=name, password=generate_password_hash(password, method='sha256'))
            db.session.add(new_user)
            db.session.commit()
            flash('Account created!', category='success')
            return redirect(url_for('home'))

    return render_template("signup.html")

@app.route('/home',methods=["GET", "POST"])
def home():
    events = Event.query.all()
    return render_template("home.html",events=events)

@app.route('/booking', methods=['GET', 'POST'])
def booking():
    events = Event.query.all()
    return render_template('book_event.html', events=events)

@app.route("/bookseat",methods=["GET","POST"])
def bookseat():
    events=Event.query.all()
    events1 = int(request.form['event_id'])
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        seats = int(request.form['seats'])
        event_id = request.form['event_id']
        part_phone = request.form['part_phone']
        if seats <= 200:
            participant = Participants(part_name=name,seats=seats, part_phone=part_phone, email=email, event_id=event_id)
            db.session.add(participant)
            """events.capacity -= seats"""
            db.session.commit()

            return redirect(url_for('home'))

    return render_template('book_event.html',events=events)

@app.route("/adminmanage",methods=["GET","POST"])
def adminmanage():

    return render_template('adminmanage.html')


@app.route('/add_event',methods=["GET","POST"])
def add_event():
    if request.method == "POST":
        id = request.form.get("event_id")
        name = request.form.get('name')
        show_date = request.form.get('show_date')
        place = request.form.get('place')
        capacity = request.form.get('capacity')
        organizer_phone = request.form.get('organizer_phone')
        event_desc = request.form.get('event_desc')
        event_type = request.form.get('event_type')
        event_loc = request.form.get('event_loc')
        event_status = request.form.get('event_status')
        event = Event(id=id,name=name,place=place,event_status=event_status,event_loc=event_loc,event_type=event_type,show_date = show_date,capacity=capacity,organizer_phone=organizer_phone, event_desc=event_desc,)
        db.session.add(event)
        db.session.commit()
        return redirect(url_for("adminmanage"))
    return render_template("adminmanage.html")


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)





