import { Router } from 'express';
import { createPayments, getPaymentMethods, getPaymentsByVisit } from '../controllers/payment.controller';

import { isAuthed } from '../middlware/authMiddleware';

const router = Router();

router.get('/paymentMethods', isAuthed, getPaymentMethods);
router.get('/payment', isAuthed, getPaymentsByVisit);
router.post('/payment', isAuthed, createPayments);

export default router;
