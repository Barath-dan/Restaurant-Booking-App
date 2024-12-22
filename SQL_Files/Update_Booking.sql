DROP PROCEDURE Update_Booking;

DELIMITER $$

CREATE PROCEDURE `Update_Booking`(IN old_date DATE, IN New_Date DATE,IN cust_id INT)
BEGIN
    -- Check if the booking exists
    DECLARE booking_exists INT;

    SELECT COUNT(*) INTO booking_exists
    FROM bookings
    WHERE Booking_Date = old_date AND Customer_ID=cust_id;

    IF booking_exists > 0 THEN
        -- If the booking exists, update the booking date
        UPDATE bookings 
        SET Booking_Date = New_Date
        WHERE Booking_ID = book_id;

        -- Return success message
        SELECT CONCAT('Your has been updated to ', New_Date) AS Status;
    ELSE
        -- If the booking does not exist, return an error message
        SELECT 'Booking not found.' AS Status;
    END IF;
END $$

DELIMITER ;
