import connectionDB from "../database.js";
import { v4 as uuidV4 } from "uuid";

export default async function SignInController(req, res) {

    const userData = res.locals.userData;
    const token = uuidV4();

    try {

        const newSession = await connectionDB.query("SELECT * FROM sessions WHERE user_id=$1;", [
            userData.id,
        ]);

        if (newSession) {
            await connectionDB.query("DELETE FROM sessions WHERE user_id=$1;", [userData.id]);;
        }

        await connectionDB.query(
            "INSERT INTO sessions (user_id, token) VALUES ($1, $2);",
            [userData.id, token]
        );

        res.status(200).send(token);
    } catch (error) {
        res.status(500).send(error.message);
    }
}