switch (room) {
    case RM_Start:
        room_goto(RM_Second);
        break;
    case RM_Second:
        room_goto(RM_Last);
        break;
}