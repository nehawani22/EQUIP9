const express = require("express");
const mysql = require("mysql2");
const bcrypt = require("bcrypt");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.json());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "Equip9",
});

db.connect((err) => {
  if (err) throw err;
  console.log("Database connected!");
});

// Create User
app.post("/register", async (req, res) => {
  const { firstName, lastName, mobileNumber, password } = req.body;
  const passwordHash = await bcrypt.hash(password, 10);
  const query = `CALL CreateUser(?, ?, ?, ?, 'admin');`;
  db.query(query, [firstName, lastName, mobileNumber, passwordHash], (err) => {
    if (err) res.status(500).send(err.message);
    else res.send("User Registered!");
  });
});

// Get User
app.get("/user/:mobileNumber", (req, res) => {
  const query = `CALL GetUser(?);`;
  db.query(query, [req.params.mobileNumber], (err, results) => {
    if (err) res.status(500).send(err.message);
    else res.json(results[0]);
  });
});

app.listen(5000, () => {
  console.log("Server running on port 5000");
});
app.get("/", (req, res) => {
    res.send("Backend is running!");
  });