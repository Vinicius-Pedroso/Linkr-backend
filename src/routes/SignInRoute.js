import { Router } from "express";
import SignInController from "../controllers/SignInController.js";
import SignInValidation from "../middlewares/SignInValidation.js";

const SignInRouter = Router();

SignInRouter.post("/signin",SignInValidation, SignInController);

export default SignInRouter;