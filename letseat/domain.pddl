;Header and description

(define (domain letseat)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        location locatable - object
        bot cupcake - locatable
        robot - bot
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (on ?obj - locatable ?loc - location)
        (holding ?arm - locatable ?cupcake - locatable)
        (arm-empty)
        (path ?location1 - location ? location2 - location)
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
        :parameters (?arm - bot
                     ?from - location
                     ?to - location)
        :precondition (and 
            (on ?arm ?from)
            (path ?from ?to)
        )
        :effect (and 
            (not (on ?arm ?from))
            (on ?arm ?to)    
        )
    )
)