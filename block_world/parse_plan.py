from typing import List

def move_action(args: List[str]):
    print(f"Move action executed with args: {args}")

def grasp_action(args: List[str]):
    print(f"Grasp action executed with args: {args}")

def place_action(args: List[str]):
    print(f"Place action executed with args: {args}")

def execute_command(command: str, args: List[str]):
    match command:
        case "move":
            move_action(args)
        case "grasp":
            grasp_action(args)
        case "place":
            place_action(args)
        case _:
            print(f"Unknown command: {command}")

def parse_plan(plan_file: str) -> List[List[str]]:
    cmd_book = []
    with open(plan_file, 'r') as f:
        plan = f.readlines()

    for i in range(len(plan)-1):
        plan[i] = plan[i].strip()
        plan[i] = plan[i][1:-1]
        cmd_line = plan[i].split(' ')
        cmd = cmd_line[0]
        args = cmd_line[1:]

        cmd_book.append([cmd, args])

    return cmd_book

def main():
    plan_file = 'block_world/sas_plan.1'
    cmd_book = parse_plan(plan_file)

    for cmd, args in cmd_book:
        execute_command(cmd, args) # type: ignore

if __name__ == "__main__":
    main()