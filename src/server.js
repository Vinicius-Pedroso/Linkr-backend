import express from "express";
import cors from "cors";
import SignInRouter from "./routes/SignInRoute.js";
import SignUpRouter from "./routes/SignUpRoute.js";

const app = express();
app.use(express.json());
app.use(cors());

app.use(SignInRouter);
app.use(SignUpRouter);

const port = process.env.PORT || 4000;
app.listen(port, () => console.log(`Server running in port: ${port}`));