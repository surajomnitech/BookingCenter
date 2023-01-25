# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(
    username: "suraj",
    password: "suraj",
    firstname: "Suraj",
    lastname: "Wijethunge",
    phonenumber:"+940740068585",
    isactive:true
)

user = User.first
``
bookingstatuses = BookingStatus.create([{status: "confirmed"},{status: "tentative"},{status: "cancelled"}])

bookingelementtype = BookingElementType.create(elementtype: "Basketball Court")

bookingelementtype = BookingElementType.first

p "bookingelementtype #{bookingelementtype.to_json} "

site = Site.create(
    name:"Austrasia Sports Complex",
    address: "Pelawaththa",
    phonenumber: "+940074456336",
    contactperson: "Steve John",
    email: "contact@austrasia.com",
    isactive: true
    )

site = Site.last

p "site #{site.to_json}"

bookingelements = BookingElement.create([{
        name: "Michael Jordan Court",
        availablefrom: "2023-01-20 08:00",
        booking_element_type: bookingelementtype,
        timeslotlengthhr: 1,
        renewauto: true,
        rate: 45.50,
        bookingcyclelength: 3,
        site: site,
        isactive: true
    },
    {
        name: "Magic Johnson Court",
        availablefrom: "2023-01-21 08:00",
        booking_element_type: bookingelementtype,
        timeslotlengthhr: 1,
        renewauto: true,
        rate: 48.50,
        bookingcyclelength: 3,
        site: site,
        isactive: true
    }
])

bookingelement = BookingElement.includes(:booking_element_available_times).first

# publish the available times of bookingelement
#when booking element is defining we need to set up what are the opening hours and how long business is open to allow people to book the elements
#here we set up the weekdays and on every day what time business starts and how long its open. 
#based on that later we will create the slots for the bookingelement

# weekdays = ["MONDAY", "TUESDAY", "WEDNESDAY","THURSDAY", "FRIDAY", "SATURDAY","SUNDAY"]

# weekdays.each { |day|
#     BookingElementAvailableTime.create(
#         weekday: day,
#         start_time: "08:00".to_time,
#         openhours: 12,
#         booking_element: bookingelement
#     )
# }

# end of publish the available times of bookingelement

# publish the slots table based on bookingelement

#in booking element this is the date booking element will start accepting the bookings
start_date = bookingelement.availablefrom.to_datetime

#from the start date there is a cycle defined. e.g one month, two months. so based on the cycle here we will create
#slots for the bookingelement. one slot will be measured in hours and that can be defined in bookingelement.
#we will create slots for the entire booking cycle. where allocation is false and no bookingid
#once cycle is at end of its defines time line we will need to setup a job to re generate for the future months. there is a auto flag
# if not auto then we will not generate them via jobs. 
#when a bookingelement is created we need to generate these slots immediately. then only booking element will be available to book.

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

# end of publish the slots table based on bookingelement


