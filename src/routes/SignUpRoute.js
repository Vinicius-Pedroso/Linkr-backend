import { Router } from "express";
import SignUpController from "../controllers/SignUpController.js";

const SignUpRouter = Router();

SignUpRouter.post("/signup", SignUpController);

export default SignUpRouter;