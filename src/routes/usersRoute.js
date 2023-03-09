import { Router } from "express";
import { showUsers } from "../controllers/UsersController.js";

const router = Router()

router.get("/users", showUsers)

export default router