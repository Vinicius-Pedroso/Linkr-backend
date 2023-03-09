import connectionDB from "../database.js";
import signUpSchema from "../schemas/SignUpSchema.js";

export default async function SignUpValidation (req,res,next){    
  const userData = req.body;
  const { email } = userData;

  const { err } = signUpSchema.validate(user, { abortEarly: false });

  if (err) {
    const errors = err.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }

  try {

    const userExisteCheck = await connectionDB.query("SELECT * FROM users WHERE email=$1;", [email]);
    if (userExisteCheck) {
      return res.sendStatus(409);
    }

    res.locals.userData = userData;

    next();

  } catch (err) {
    res.status(500).send(err.message);
  }
}