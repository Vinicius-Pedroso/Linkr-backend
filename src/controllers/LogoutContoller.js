import connectionDB from "../database";


export default async function Logout (req,res){

    const userData = res.locals.userData;

    try {

        await connectionDB.query("DELETE FROM sessions WHERE user_id=$1;",
        [userData.id]);

        return res.sendStatus(200)

    }catch(err){
        return res.status(500).send(err.message);
    }

}