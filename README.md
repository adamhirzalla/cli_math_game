# **Planning phase**

## **Goal**

Create a 2-Player math game where:

- Players take turns to answer simple math addition problems.
- A new math question is generated for each turn by picking two numbers between 1 and 20.
- The player whose turn it is is prompted the question and must answer correctly or lose a life.
- Both players start with 3 lives. They lose a life if they mis-answer a question.
- At the end of every turn, the game should output the new scores for both players, so players know where they stand.

## Extracting Nouns for Classes

- Player
- Question
- Game

## Writing class roles

### **Player**

- Sate: name, lives
- Behaviour: lose_a_life

### **Question**

- Sate: correct answer
- Behaviour: is_correct?

### **Game**

- Sate: player1, player2, current_player
- Behaviour: is_correct?

```
What information is relevant to each class?
-> Player: keeping track of players' lives
-> Question: generating a new question
-> Game: initializing 2 players and questions

What will they need in order to be initialized?
> Game -> Players -> Question

What public methods will be defined on them?
-> Player: wrong (to subtract a life for caller player)
-> Question:
- new_question (to generate a new question/answer)
- is_correct? (to check whether user input is correct)
-> Game: start (to start the game)
```

```
Which class will contain the game loop (where each instance of the loop is the other players turn)?
-> Game class

Which class should manage who the current_player is?
-> Game class (can also create a separate class such as Turn or Current)

Which class(es) will contain user I/O and which will not have any?
-> Player/Question: No I/O
-> Game: Has user I/O
```

> The better approach would have the I/O in the Question initializer, and having the Game class instantiate a new Question object on every iteration
