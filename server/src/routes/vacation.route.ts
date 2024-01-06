import { Router } from 'express';
import {
  deleteVacation,
  getDoctorVacations,
  createVacation,
  updateVacation,
  getAllVacations,
} from '../controllers/vacation.controller';

import { isAuthed } from '../middlware/authMiddleware';

const router = Router();

router.get('/vacation', isAuthed, getAllVacations);
router.post('/vacation', isAuthed, createVacation);
router.get('/vacation/:id', isAuthed, getDoctorVacations);
router.delete('/vacation/:id', isAuthed, deleteVacation);
router.patch('/vacation/:id', isAuthed, updateVacation);

export default router;
