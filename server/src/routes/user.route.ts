import { Router } from "express";
import { getUserFromToken } from "../controllers/user.controller";

import { isAuthed } from "../middlware/authMiddleware";

const router = Router();

router.get("/user", isAuthed, getUserFromToken);

export default router;
