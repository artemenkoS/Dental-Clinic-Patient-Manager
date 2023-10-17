import { Request, Response } from "express";

export const getUserFromToken = (req: Request, res: Response) => {
  const user = res.locals.user;

  res.status(200).json({ user });
};
