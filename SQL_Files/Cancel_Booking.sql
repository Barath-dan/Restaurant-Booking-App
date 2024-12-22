-- STORED PROCEDURE FOR BOOKING CANCELLATION
DROP PROCEDURE Cancel_Booking

DELIMITER //

CREATE PROCEDURE Cancel_Booking(IN cust_id INT,IN b_date DATE)
BEGIN
    -- Check if the booking exists
    DECLARE booking_exists INT;
    
    SELECT COUNT(*) INTO booking_exists
    FROM bookings
    WHERE Customer_ID = cust_id AND Booking_Date=b_date;

    IF booking_exists > 0 THEN
        -- If the booking exists, delete it
        DELETE FROM bookings
        WHERE Customer_ID = cust_id AND Booking_Date=b_date;

        -- Return success message
        SELECT CONCAT('Your Booking has been cancelled.') AS Status;
    ELSE
        -- If the booking does not exist, return an error message
        SELECT 'Booking not found.' AS Status;
    END IF;
END //

DELIMITER ;

CALL Cancel_Booking(19,101) ;