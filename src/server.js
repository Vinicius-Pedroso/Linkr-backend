import express from "express";
import cors from "cors";
import SignInRouter from "./routes/SignInRoute.js";
import SignUpRouter from "./routes/SignUpRoute.js";
import usersRoute from "./routes/usersRoute.js"
import dotenv from "dotenv";

dotenv.config();

const app = express();
var express = require('express')
var cors = require('cors')
app.use(express.json());
app.use(cors());

var corsOptions = {
    origin: function (origin, callback) {
      // db.loadOrigins is an example call to load
      // a list of origins from a backing database
      db.loadOrigins(function (error, origins) {
        callback(error, origins)
      })
    }
}

app.use(SignInRouter);
app.use(SignUpRouter);

const port = process.env.PORT || 4000;
app.listen(port, () => console.log(`Server running in port: ${port}`));