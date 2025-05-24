# ShellServer with Tutor Agents

This project provides a shell server with integrated history and math tutor agents using MCP (Multi-Component Protocol).

## Features

- Terminal command execution
- History Tutor Agent
- Math Tutor Agent

## Installation

1. Create a virtual environment:

```bash
python -m venv .venv
source .venv/bin/activate
```

2. Install dependencies:

```bash
pip install -r requirements.txt
```

## Usage

### Running the Server

```bash
python server.py
```

### Using the Tutor Agents

#### History Tutor

The history tutor can be used to get detailed historical information. Example usage:

```python
from agents.tutors import HistoryQuestion

question = HistoryQuestion(
    topic="World War II",
    time_period="1939-1945",
    specific_event="D-Day"
)
response = await history_tutor(question)
```

#### Math Tutor

The math tutor provides step-by-step solutions to mathematical problems. Example usage:

```python
from agents.tutors import MathQuestion

question = MathQuestion(
    problem="Solve for x: 2x + 5 = 15",
    subject="algebra",
    difficulty="easy"
)
response = await math_tutor(question)
```

## Development

The project uses:

- FastAPI for the web server
- MCP for agent communication
- Pydantic for data validation

## License

MIT License
