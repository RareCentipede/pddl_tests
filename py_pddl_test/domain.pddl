(define (domain my_domain)
    (:requirements :negative-preconditions :strips :typing)
    (:types
        type_1 - object
        type_2 - type_1
    )
    (:constants a b c - type_1)
    (:predicates (p1 ?x - type_1 ?y - type_1 ?z - type_1)  (p2 ?x - type_1 ?y - type_1))
    (:action action-1
        :parameters (?x - type_1 ?y - type_1 ?z - type_1)
        :precondition (and (p1 ?x ?y ?z) (not (p2 ?y ?z)))
        :effect (p2 ?y ?z)
    )
)