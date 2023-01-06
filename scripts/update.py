import sys
import json
import pathlib
from typing import Dict, List


def read_file(file: pathlib.Path):
    with file.open() as fd:
        content = json.load(fd)
    return content.get("gitmojis", [])

def write_file(file: pathlib.Path, content: str):
    with file.open("w") as fd:
        fd.write(content)


def to_lua(emojis: List[Dict[str, str]]):
    s = "local emojis = {\n"
    for item in emojis:
        value = item.get("emoji")
        text = item.get("code")
        description = item.get("description")
        s += f'{{ value = "{value}", text = "{text}", description = "{description}"}},'
    s += "}\n\nreturn emojis"
    return s


def main(infile: str, outfile: str):
    emojis = read_file(pathlib.Path(infile))
    write_file(pathlib.Path(outfile), to_lua(emojis))


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
