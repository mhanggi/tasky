# tasky

Tasky is a simple task runner. It reads the tasks from a JSON file and optionally shows a notification after launching them.

The JSON file should be placed into ~/.config/tasky/tasks.json and has the following structure:

```JSON
[
  {
    "name": "Area screenshot",
    "command": "gnome-screenshot -a"
  },
  {
    "name": "Mute",
    "command": "pactl set-sink-mute @DEFAULT_SINK@ true",
    "notification": "Audio muted"
  }
]
```

If tasky is called without an argument it displays the list of configured tasks. A task can be launched by providing the task name as an argument.

Tasky has been written to be used with rofi scripts. See 

```console
foo@bar:~$ man 5 rofi-script
```

Tasky and rofi can be used together as:

```console
foo@bar:~$ rofi -show task -modi "task:tasky"
foo@bar:~$ rofi -show combi -combi-modi 'drun,task' -modi 'combi,task:tasky' 
```
