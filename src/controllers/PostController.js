import postRepository from "../repositories/PostRepository.js";

export async function createPost(req, res) {
  const { comment } = req.body;
  const { user, metaDado } = res.locals;
  const { url, title, image, description } = metaDado;

  try {
    const linkRegister =
      (await postRepository.insertLink(url, title, image, description))
        .rows[0] ||
      (await postRepository.getLinkById(url, title, image, description))
        .rows[0];

    (await postRepository.sendPost(user.id, linkRegister.id, comment || ""))
      .rows;
    res.status(201).send("successfully published");
  } catch (error) {
    console.error(error);
    res.status(500);
  }
}
