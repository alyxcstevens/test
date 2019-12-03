connection: "flightstats"

# include all the views
include: "/views/**/*.view"

datagroup: 111111_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
persist_with: 111111_default_datagroup


explore: flights {
  join: airports {
    view_label: "Departure Airport"
    type: left_outer
    relationship: many_to_one
    sql_on: ${flights.destination} = ${airports.code} ;;
  }
}

explore: accidents {}


#
# explore: aircraft {}
#
# explore: aircraft_models {}
#
# explore: airports {}
#
# explore: cal454 {}
#
# explore: carriers {}
#
# explore: flights_by_day {}
#
# explore: ontime {}
#
# explore: temp2 {}
