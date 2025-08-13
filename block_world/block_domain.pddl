;Header and description

(define (domain block_world)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        location locatable - object
        block agent - locatable
        static dynamic - block
        robot - agent
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (at ?obj - locatable ?loc - location) ; Object ?obj is at location ?loc)
        (on ?block1 - block ?block2 - block)
        (at-top ?block - block) ; Block ?block is at the top of its stack
        (gripper-empty)
        (holding ?robot - robot ?block - block) ; Robot ?robot is holding block ?block
        (path-blocked-from-to ?from - location ?to location) ; Path from ?from to ?to is blocked
    )


    (:functions ;todo: define numeric functions here
    )


    ;define actions here
    (:action move
            :parameters (?robot - robot
                        ?from - location
                        ?to - location)

            :precondition (and
                (at ?robot ?from)
                (not (path-blocked-from-to ?from ?to location)))

            :effect (and
                (not (at ?robot ?from))
                (at ?robot ?to))
    )

    (:action grasp
        :parameters (?robot - robot
                     ?block - dynamic
                     ?loc - location)

        :precondition (and
            (at ?robot ?loc)
            (at ?block ?loc)
            (gripper-empty)
            (at-top ?block))

        :effect (and
                    (not (at ?block ?loc))
                    (holding ?robot ?block)
                    (not (at-top ?block))
                    (forall (?below-block - block)
                        (when (on ?block ?below-block)
                            (at-top ?below-block)
                        )
                    )
                )
    )

    (:action place
        :parameters (?robot - robot
                     ?block - dynamic
                     ?loc - location)

        :precondition (and
                (at ?robot ?loc)
                (holding ?robot ?block))

        :effect (and
                    (gripper-empty)
                    (not (holding ?robot ?block))
                    (at ?block ?loc)
                    (at-top ?block)
                    (forall (at ?below-block - block ?loc)
                        (when (at-top ?below-block)
                            (not (at-top ?below-block))
                            (on ?block ?below-block)
                        )
                    )
                )

    )
)