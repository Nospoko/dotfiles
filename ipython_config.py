c.InteractiveShellApp.exec_lines = []
c.InteractiveShellApp.exec_lines.append('%load_ext autoreload')
c.InteractiveShellApp.exec_lines.append('%autoreload 2')

c.InteractiveShellApp.exec_lines += [
    "from rich import print",
    "import rich.pretty",
    "rich.pretty.install()",
    "print('[bold green]what up :tada:')"
]
