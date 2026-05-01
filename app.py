from flask import Flask, render_template, request
import psycopg2

app = Flask(__name__)

def get_db():
    return psycopg2.connect(
        dbname="parking_db",
        user="postgres",
        password="rudgns5875.",
        host="localhost"
    )

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/parcels")
def parcels():
    property_type = request.args.get("property_type", "")
    conn = get_db()
    cur = conn.cursor()
    if property_type:
        cur.execute("SELECT apn, property_type, total_square_footage, total_estimated_parking_spaces FROM Parcel WHERE property_type = %s ORDER BY total_estimated_parking_spaces DESC", (property_type,))
    else:
        cur.execute("SELECT apn, property_type, total_square_footage, total_estimated_parking_spaces FROM Parcel ORDER BY total_estimated_parking_spaces DESC")
    parcels = cur.fetchall()
    cur.close()
    conn.close()
    return render_template("parcels.html", parcels=parcels, property_type=property_type)

@app.route("/meters")
def meters():
    ada = request.args.get("ada", "")
    active = request.args.get("active", "")
    conn = get_db()
    cur = conn.cursor()
    query = "SELECT meter_number, street_address, type, rate_time_limit, active, ada_accessible, motorcycle_only FROM Street_Parking_Meter WHERE 1=1"
    params = []
    if ada:
        query += " AND ada_accessible = %s"
        params.append(ada == "true")
    if active:
        query += " AND active = %s"
        params.append(active == "true")
    cur.execute(query, params)
    meters = cur.fetchall()
    cur.close()
    conn.close()
    return render_template("meters.html", meters=meters, ada=ada, active=active)

if __name__ == "__main__":
    app.run(debug=True)
