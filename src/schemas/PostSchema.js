import joi from "joi";

const PostSchema = joi.object({
  url: joi.string().uri().required(),
  comment: joi.string(),
});

export default PostSchema;
