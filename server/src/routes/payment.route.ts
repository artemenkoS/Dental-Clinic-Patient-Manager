import { Router } from 'express';
import { getPaymentMethods } from '../controllers/payment.controller';

import { isAuthed } from '../middlware/authMiddleware';

const router = Router();

router.get('/paymentMethods', isAuthed, getPaymentMethods);

export default router;
