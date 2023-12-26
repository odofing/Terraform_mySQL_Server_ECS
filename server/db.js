import mysql from "mysql2"

// export const db = mysql.createConnection({
// host: process.env.HOST_LOCAL,
//  user: process.env.USER_LOCAL,
//password: process.env.PASSWORD,
// database: process.env.DATABASE  
// })
export const db = mysql.createConnection({

  host: process.env.HOST,
  user: process.env.USER,
  port: process.env.SQLPORT,
  password: process.env.PASSWORD,
  database: process.env.DATABASE
})

db.connect((err) => {
  if (err) {
    console.log(err.message)

  } else {
    console.log('db connected to aws')
  }
})
