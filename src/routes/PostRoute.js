import { Router } from "express";
import { validateSchema } from "../middlewares/validateSchema.js";
import PostSchema from "../schemas/PostSchema.js";
import SignInValidation from "../middlewares/SignInValidation.js";
import { createPost } from "../controllers/PostController.js";


const postRoute = Router();

postRoute.post("/post",SignInValidation, validateSchema(PostSchema), createPost);

export default postRoute;