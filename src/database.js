import pg from "pg";
import dotenv from "dotenv";
dotenv.config();

const { Pool } = pg;

const configDatabase = {
  connectionString: process.env.DATABASE_URL,
  ...(process.env.NODE_ENV === "production" && {
    ssl: {
      rejectUnauthorized: false,
    },
  }),
};

/* const configDatabase = {
  connectionString: process.env.DATABASE_URL,
}; */

// if (process.env.MODE === "prod") configDatabase.ssl = true;

// export const db = new Pool(configDatabase);

const connectionDB = new Pool(configDatabase);

export default connectionDB;