stock QuickSort_Pair(array[][], bool:desc, left, right)
{
    #define PAIR_FIST (0)
    #define PAIR_SECOND (1)

    new
        tempLeft = left,
        tempRight = right,
        pivot = array[(left + right) / 2][PAIR_FIST],
        tempVar
    ;
    while (tempLeft <= tempRight)
    {
        if (desc)
        {
            while (array[tempLeft][PAIR_FIST] > pivot)
            {
                tempLeft++;
            }
            while (array[tempRight][PAIR_FIST] < pivot)
            {
                tempRight--;
            }
        }
        else
        {
            while (array[tempLeft][PAIR_FIST] < pivot)
            {
                tempLeft++;
            }
            while (array[tempRight][PAIR_FIST] > pivot)
            {
                tempRight--;
            }
        }

        if (tempLeft <= tempRight)
        {
            tempVar = array[tempLeft][PAIR_FIST];
            array[tempLeft][PAIR_FIST] = array[tempRight][PAIR_FIST];
            array[tempRight][PAIR_FIST] = tempVar;

            tempVar = array[tempLeft][PAIR_SECOND];
            array[tempLeft][PAIR_SECOND] = array[tempRight][PAIR_SECOND];
            array[tempRight][PAIR_SECOND] = tempVar;

            tempLeft++;
            tempRight--;
        }
    }
    if (left < tempRight)
    {
        QuickSort_Pair(array, desc, left, tempRight);
    }
    if (tempLeft < right)
    {
        QuickSort_Pair(array, desc, tempLeft, right);
    }

    #undef PAIR_FIST
    #undef PAIR_SECOND
}

SortArrayContent(array[][], left, right)
{
    new
        tmp_left = left,
        tmp_right = right,
        Float:pivot = array[(left + right) / 2][AreaIT_distance],
        areaid,
        Float:distance;

    while(tmp_left <= tmp_right)
    {
        while(array[tmp_left][AreaIT_distance] > pivot)
            tmp_left++;

        while(array[tmp_right][AreaIT_distance] < pivot)
            tmp_right--;

        if(tmp_left <= tmp_right)
        {
            areaid = array[tmp_left][AreaIT_ID];
            array[tmp_left][AreaIT_ID] = array[tmp_right][AreaIT_ID];
            array[tmp_right][AreaIT_ID] = areaid;

            distance = array[tmp_left][AreaIT_distance];
            array[tmp_left][AreaIT_distance] = array[tmp_right][AreaIT_distance];
            array[tmp_right][AreaIT_distance] = distance;

            tmp_left++;
            tmp_right--;
        }
    }

    if(left < tmp_right)
        SortArrayContent(array, left, tmp_right);

    if(tmp_left < right)
        SortArrayContent(array, tmp_left, right);
}

IsPlayerAngleToPoint(playerid, Float:px, Float:py, Float:pz, Float:hitz = 0.4, Float:range_angle = 100.0)
{
    new Float:curangle, Float:angle, Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x,y,z);
    GetPlayerFacingAngle(playerid, angle);

    curangle = GetAngleToPoint(x,y,px,py);

    if((curangle-range_angle) <= angle <= (curangle+range_angle) && ((z - pz) < hitz)) return 1;
    return 0;
}

stock convertTime_SecondsMinutes(time, &minutes, &seconds)
{
    minutes = floatround(time / 60);
    seconds = floatround(time - minutes  * 60);
    return 1;
}

stock GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
    new Float:a;
    GetPlayerPos(playerid, x, y, a);
    GetPlayerFacingAngle(playerid, a);
    x += (distance * floatsin(-a, degrees));
    y += (distance * floatcos(-a, degrees));
}

stock GetPointInFrontOfPos(&Float:x, &Float:y, /*Float:x, Float:y,*/ Float:angle, Float:distance) //Credit to Sacky/Simon/Y_Less for this, I haven't actually found out whos the original was
{
           
    x += (distance * floatsin(-angle, degrees));

    y += (distance * floatcos(-angle, degrees));
    return 1;
}

stock Float:absoluteangle_func(Float:angle)
{
    while(angle < 0.0)angle += 360.0;
    while(angle > 360.0)angle -= 360.0;
    return angle;
}


stock Float:GetAngleToPoint(Float:fPointX, Float:fPointY, Float:fDestX, Float:fDestY)
    return absoluteangle_func(-(90-(atan2((fDestY - fPointY), (fDestX - fPointX)))));

/*
    Distance between 2 points in 3D space
*/
stock Float:Distance_func(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2)
    return floatsqroot((((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2))+((z1-z2)*(z1-z2))));


stock AngleInRangeOfAngle(Float:a1, Float:a2, Float:range) {
    a1 -= a2;
    return (a1 < range) && (a1 > -range);
}

stock GetVehicleRotation(vehicleid,&Float:rx,&Float:ry,&Float:rz){
    new Float:qw,Float:qx,Float:qy,Float:qz;
    GetVehicleRotationQuat(vehicleid,qw,qx,qy,qz);
    rx = asin(2*qy*qz-2*qx*qw);
    ry = -atan2(qx*qz+qy*qw,0.5-qx*qx-qy*qy);
    rz = -atan2(qx*qy+qz*qw,0.5-qx*qx-qz*qz);
}

stock GetVehicleRotationY(vehicleid,&Float:ry){
    new Float:qw,Float:qx,Float:qy,Float:qz;
    GetVehicleRotationQuat(vehicleid,qw,qx,qy,qz);
    ry = -atan2(qx*qz+qy*qw,0.5-qx*qx-qy*qy);
}

stock VectorToPos(playerid, &Float:x, &Float:y, &Float:z, Float:scale)
{
    new
        Float: p[3],
        Float: v[3]
    ;

    GetPlayerCameraPos            ( playerid, p[0], p[1], p[2] );
    GetPlayerCameraFrontVector    ( playerid, v[0], v[1], v[2] );

    x = p[0] + (v[0] * scale);
    y = p[1] + (v[1] * scale);
    z = p[2] + (v[2] * scale);
}

stock randomString(strDest[], strLen = 10)
{
    while(strLen--)
        strDest[strLen] = random(2) ? (random(26) + ('A')) : (random(10) + '0');
}