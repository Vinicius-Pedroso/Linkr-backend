import connectionDB from "../database.js";


async function sendPost(url_post, comment, user_id){
    return connectionDB.query(`INSERT INTO post (url_post, comment, user_id) VALUES ($1, $2, $3)`, [url_post, comment, user_id] );
}

async function insertLink(){
    return connectionDB.query(`INSERT INTO links (url, title, image, description) SELECT $1, $2, $3, $4 WHERE NOT EXISTS (SELECT links, id FROM links WHERE links=$1) RETURNING id;`, [url, title, image, description])
}

async function getLinkById(links) {
    return connectionDB.query(`SELECT id FROM links WHERE links=$1;`, [links]);
}

const postRepository = {
    sendPost,
    insertLink,
    getLinkById
}

export default postRepository;

