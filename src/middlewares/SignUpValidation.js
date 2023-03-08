import connectionDB from "../database.js";
import signUpSchema from "../schemas/SignUpSchema.js";

export default async function SignUpValidation (req,res,next){    
  const user = req.body;
  const { email } = user;

  const { error } = signUpSchema.validate(user, { abortEarly: false });

  if (error) {
    const errors = error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }

  try {

    const userExisteCheck = await connectionDB.query("SELECT * FROM users WHERE email=$1;", [email]);
    if (userExisteCheck) {
      return res.sendStatus(409);
    }

    res.locals.user = user;

    next();

  } catch (err) {
    res.status(500).send(error.message);
  }
}