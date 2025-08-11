from pddl.logic import Predicate, constants, variables, Variable, Constant
from pddl.core import Domain, Problem
from pddl.action import Action
from pddl.requirements import Requirements
from pddl.formatter import domain_to_string, problem_to_string
from pddl import parse_domain, parse_problem

## Parse the domain
cake_domain = parse_domain("letseat/domain.pddl")
predicates = cake_domain._predicates

## Define the problem
# Objects
arm = Constant("arm", type_tag="robot")
peenars = constants("peenar_alex peenar_luis", type_="cupcake")
table, plate1, plate2 = constants("table plate1 plate2", type_="location")
larry = Constant("larry", type_tag="beast")

# Predicates
obj, cupcake = variables("obj cupcake", types=["locatable"])
loc, loc1, loc2, x = variables("loc loc1 loc2 x", types=["location"])
unicorn = Variable("unicorn", type_tags=["beast"])
cupcake = Variable("cupcake", type_tags=["cupcake"])

on = Predicate("on", obj, loc)
arm_empty = Predicate("arm-empty")
path = Predicate("path", loc1, loc2)
is_plate = Predicate("is_plate", x)
eating = Predicate("eating", unicorn, cupcake)

# Init
init = [on(arm, table),
        on(peenars[0], plate1),
        on(peenars[1], plate2),
        arm_empty(),
        path(table, plate1),
        path(table, plate2),
        path(plate1, plate2),
        path(plate2, plate1),
        path(plate1, table),
        path(plate2, table),
        is_plate(plate1),
        is_plate(plate2)]

# Goal
goal = [eating(larry, peenars[0]),
        eating(larry, peenars[1])]

cake_problem = Problem(
    name="letseat-problem",
    domain=cake_domain,
    objects=[arm, larry, peenars[0], peenars[1], table, plate1, plate2],
    init=init,
    goal=eating(larry, peenars[0]) & eating(larry, peenars[1]),
)

print(cake_problem)