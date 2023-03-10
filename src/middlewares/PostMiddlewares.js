import urlMetadata from "url-metadata"

export async function searchMetadata(req, res, next) {
    const { links } = req.body;
    
    try {
      const { title, image, description } = await urlMetadata(links);
      const metaDado = { url, title, image, description };
      res.locals.metaDado = metaDado;
      next();

    } catch (err) {
      console.error(err);
      res.status(500);
    }
  }

 