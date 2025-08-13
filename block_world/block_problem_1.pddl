(define (problem blocks_1) (:domain block_world)
    (:objects
        d1 d2 d3 - dynamic
        s1 s2 - static
        rob - robot
        p0 p1 p2 p3 p4 p5 p6 p9 p10 - location
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (at rob p0)
        (at s1 p1)
        (at d1 p1)
        (at d2 p1)
        (at d3 p1)

        (on d2 d1)
        (on d3 d2)
        (on d1 s1)
        (at-top d3)

        (gripper-empty)
    )

    (:goal (and
                ;todo: put the goal condition here
                (at d1 p4)
                (at d2 p5)
                (at d3 p6)
           )
    )

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)