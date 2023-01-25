class GenerateSlotsJob < ApplicationJob
  queue_as :default

  def perform(bookingelementid)

    bookingelement = BookingElement.find(bookingelementid.to_i)
    # Do something later
    start_date = bookingelement.availablefrom.to_datetime
    end_date  = DateTime.new(start_date.year, start_date.month, start_date.day, 00, 00, 0) + bookingelement.bookingcyclelength.to_int.months
    slot_length_hours = bookingelement.timeslotlengthhr

    (start_date).upto(end_date).each do |day|
      
        availability = bookingelement.booking_element_available_times.where(weekday: "MONDAY")
        start_time = availability[0].start_time.strftime("%k:%M").to_time
        start_datetime = DateTime.new(day.year, day.month, day.day, start_time.hour, start_time.min, 0)
        end_datetime = start_datetime + availability[0].openhours.to_int.hours
        #p "start datetime #{start_datetime} end time #{end_datetime}" 
        
        slot_start = start_datetime
        slot_end = slot_start + slot_length_hours.to_int.hours

        while slot_end <= end_datetime
        
        # p "slot start  #{slot_start} slot end  #{slot_end}" 

        slot = Slot.create(
            startdatetime: slot_start,
            enddatetime: slot_end,
            allocated: false,
            booking_element: bookingelement
        )

        p "slot #{slot.to_json}" 

        slot_start = slot_end
        slot_end = slot_end + slot_length_hours.to_int.hours

        end

    end
  end
end
