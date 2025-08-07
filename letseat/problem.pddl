(define (problem letseat-simple) (:domain letseat)
    (:objects
        arm - robot
        peenar_alex - cupcake
        peenar_luis - cupcake
        table - location
        plate1 - location
        plate2 - location
        larry - beast
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (on arm table)
        (on peenar_alex table)
        (on peenar_luis table)
        (on larry table)
        
        (arm-empty)

        (path table plate1)
        (path table plate2)

        (path plate1 table)
        (path plate1 plate2)

        (path plate2 table)
        (path plate2 plate1)

        (is_plate plate1)
        (is_plate plate2)
    )

    (:goal (and
        ;todo: put the goal condition here
        ; (on strawberry_cupcake plate1)
        ; (on raspberry_cupcake plate2)
        ; (on larry plate1)
        (eating larry peenar_alex)
        ; (on larry plate2)
        (eating larry peenar_luis)
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)
