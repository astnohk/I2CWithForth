\
\ Read value from LSM6DS3TR via I2C
\
\ Use:
\     include lsm6ds3tr.fth
\     lsm6ds3tr-wake-sensor
\

: lsm6ds3tr-wake-sensor ( -- )
    $10 $3c 2 $6a i2cwrite drop
    $11 $30 2 $6a i2cwrite drop ;

: lsm6ds3tr-parse-value ( x1 ...... x14 -- y1 ...... y7 )
    \ temperature
    13 roll 8 lshift 13 roll or
    \ gyro x
    12 roll 8 lshift 12 roll or
    \ gyro y
    11 roll 8 lshift 11 roll or
    \ gyro z
    10 roll 8 lshift 10 roll or
    \ accel x
    9 roll 8 lshift 9 roll or
    \ accel y
    8 roll 8 lshift 8 roll or
    \ accel z
    7 roll 8 lshift 7 roll or ;

: lsm6ds3tr-read-value ( -- x1 ...... x7 )
    $20 1 14 $6a i2creadreg drop
    lsm6ds3tr-parse-value ;
