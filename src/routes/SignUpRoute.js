import { Router } from "express";
import SignUpController from "../controllers/SignUpController.js";
import SignUpValidation from "../middlewares/SignUpValidation.js";

const SignUpRouter = Router();

SignUpRouter.post("/signup",SignUpValidation, SignUpController);

export default SignUpRouter;