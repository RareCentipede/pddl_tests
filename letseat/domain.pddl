;Header and description

(define (domain letseat)

    ;remove requirements that are not needed
    (:requirements :typing)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        location locatable - object
        moveable cupcake plate - locatable
        bot beast - moveable
        robot - bot
        unicorn - beast
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (on ?obj - locatable ?loc - location)
        (holding ?arm - locatable ?cupcake - locatable)
        (arm-empty)
        (path ?location1 - location ?location2 - location)
        (eating ?unicorn - beast ?cupcake - cupcake)
        (is_plate ?x - plate)
    )

    ;define actions here
    (:action pick-up
        :parameters (?arm - bot
                     ?cupcake - locatable
                     ?loc - location)

        :precondition (and
            (on ?arm ?loc)
            (on ?cupcake ?loc)
            (arm-empty)
        )
        :effect (and
            (not (on ?cupcake ?loc))
            (holding ?arm ?cupcake)
            (not (arm-empty))
        )

    )

    (:action drop
        :parameters (?arm - bot
                     ?cupcake - locatable
                     ?loc - location)
        :precondition (and
            (on ?arm ?loc)
            (holding ?arm ?cupcake)
        )
        :effect (and
            (on ?cupcake ?loc)
            (arm-empty)
            (not (holding ?arm ?cupcake))
        )
    )

    (:action move
        :parameters (?agent - moveable
                     ?from - location
                     ?to - location)
        :precondition (and
            (on ?agent ?from)
            (path ?from ?to)
        )
        :effect (and
            (not (on ?agent ?from))
            (on ?agent ?to)
        )
    )

    (:action eat
        :parameters (?unicorn - beast
                     ?cupcake - locatable
                     ?plate - location
        )
        :precondition(and
            (on ?unicorn ?plate)
            (on ?cupcake ?plate)
            (is_plate ?plate)
        )
        :effect(and
            (not (on ?cupcake ?plate))
            (eating ?unicorn ?cupcake)
        )
    )
)