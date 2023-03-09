import connectionDB from "../database.js";
import signInSchema from "../schemas/SignInSchema.js";

export default async function SignInValidation(req, res, next) {

    const userData = req.body;
    const { email, password } = req.body;

    const { err } = signInSchema.validate(userData, { abortEarly: false });

    if (err) {
        const errors = err.details.map((detail) => detail.message);
        return res.status(422).send(errors);
    }

    try {

        const userDataCheck = await connectionDB.query("SELECT * FROM users WHERE email=$1;", [email]);

        if (!userDataCheck) {
            return res.sendStatus(401);
        }

        console.log(userDataCheck)

        const passwordCheck = bcrypt.compareSync(password, userDataCheck.password);
        if (!passwordCheck) {
            return res.sendStatus(401);
        }

        res.locals.userData = userData;

        next();

    } catch (error) {
        return res.status(500).send(error.message);
    }
}