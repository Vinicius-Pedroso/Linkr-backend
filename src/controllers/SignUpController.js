import connectionDB from "../database.js";
import bcrypt from "bcrypt";

export default async function SignUpController (req,res){

    const { username, email, picture, password } = res.locals.userData;
    const encryptedPassword = bcrypt.hashSync(password, 10);

    try {
        await connectionDB.query("INSERT INTO users (username, email, pictureurl, password) VALUES ($1, $2, $3, $4);",
            [username, email, picture, encryptedPassword]
        );
        return res.sendStatus(201)
    } catch(err){
        return res.status(500).send(err.message);
    }
}