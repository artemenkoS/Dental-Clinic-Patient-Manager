import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { setSelectedSlot } from '../../store/slices/visitSlice';
import { busySlotsSelector, selectedSlotSelector } from '../../store/slices/visitSlice';
import { TIME_SLOTS } from './const';
import { Slot, Wrapper } from './styled';

export const TimeSlots = () => {
  const dispatch = useAppDispatch();
  const busySlots = useAppSelector(busySlotsSelector);
  const selectedSlot = useAppSelector(selectedSlotSelector);

  const handleSelectSlot = (slot: string) => () => {
    dispatch(setSelectedSlot(slot));
  };
  return (
    <Wrapper>
      {TIME_SLOTS.map((slot) => (
        <Slot
          type="button"
          variant="outlined"
          disabled={busySlots?.has(slot) || !busySlots}
          onClick={handleSelectSlot(slot)}
          className={selectedSlot === slot ? 'selected' : ''}
        >
          {slot}
        </Slot>
      ))}
    </Wrapper>
  );
};
