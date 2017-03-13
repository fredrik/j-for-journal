# j-for-journal

`j` is a command to journal your day.

`j` is a thin wrapper over the workflow I usually use to manage a daily journal:
`git` and a text editor.

Each day gets its own file (e.g. 2017-03-13) which has three sections: general
notes, plans and done. An example follows.

```
- monday -

another glorious day!

+ plan +
walk the dog
sweep the floor

+ done +
brew coffee
```

Ideally, `j` should know how to parse tasks in 'plans' and 'done' but for 1.0
the goal is to simply allow displaying and editing today's journal and those of
yesterday and tomorrow.

## Questions and thoughts

How should `j` interact with `git`?


## Usage

`$> j`

Display today's journal page. This is the same as `$> j today`.


`$> j tomorrow`

Display tomorrow's journal.


`$> j yesterday`

Display yesterday's journal.

