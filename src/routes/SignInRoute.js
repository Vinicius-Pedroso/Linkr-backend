import { Router } from "express";
import {SignInController} from "../controllers/SignInController.js";

const SignInRouter = Router();

SignInRouter.post("/signin", SignInController);

export default SignInRouter;