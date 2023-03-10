import connectionDB from "../database.js";

export async function showUsers(req, res) {
    const peopleSearched = req.query.peopleSearched
    console.log(peopleSearched)
    try {
        const user = await connectionDB.query(`SELECT * FROM users WHERE username LIKE $1;`, [`${peopleSearched}%`])
        //console.log(user.rows[0])
        const userData = user.rows.map(item => ({
                name: item.username,
                image: item.picture_url
        }))
        console.log(userData)
        res.status(200).send(userData)
    } catch (error) {
        res.status(500).send(error.message);
    }
}