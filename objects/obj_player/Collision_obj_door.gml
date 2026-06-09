switch (room) {
    case RM_Start:
        room_goto(RM_Second);
        break;
    case RM_Second:
        room_goto(RM_Last);
        break;
    case RM_Last:
        room_goto(RM_End);
        break;
}