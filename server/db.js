import mysql from "mysql2"

// export const db = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: 'password',
//   database: "blog"
// })
export const db = mysql.createConnection({
  //host: "blog.csmththc5dxj.eu-west-1.rds.amazonaws.com",
  host: process.env.host,
  user: process.env.user,
  //user: "admin",
  //port: process.env.SQLPORT,
  port: 3306,
  password: 'password',
  database: "blog"
})

db.connect((err) => {
  if (err) {
    console.log(err.message)

  } else {
    console.log('db connected to aws')
  }
})
