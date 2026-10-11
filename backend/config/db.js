const mysql = require('mysql2');
const dotenv = require('dotenv');

dotenv.config();

const pool = mysql.createPool({
    host: process.env.DB_HOST || 'localhost',
    port: process.env.DB_PORT ? parseInt(process.env.DB_PORT) : 3306,
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASS || '',
    database: process.env.DB_NAME || 'freelancehub',
    ssl: process.env.DB_SSL === 'true' ? { rejectUnauthorized: false } : undefined,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

const promisePool = pool.promise();

// Create Database if not exists (for setup ease, though schema.sql does it too)
promisePool.query(`CREATE DATABASE IF NOT EXISTS \`${process.env.DB_NAME}\`;`)
  .then(() => console.log('Database checked/created.'))
  .catch(err => console.error('Error creating database:', err));

module.exports = promisePool;
