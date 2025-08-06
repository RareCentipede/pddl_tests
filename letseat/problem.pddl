(define (problem letseat-simple) (:domain letseat)
    (:objects
        arm - robot
        cupcake - cupcake
        table - location
        plate - location
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (on arm table)
        (on cupcake table)
        (arm-empty)
        (path table plate)
        
    )

    (:goal (and
        ;todo: put the goal condition here
        (on cupcake plate)
        
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)
